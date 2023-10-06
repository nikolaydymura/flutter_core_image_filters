//
//  VideoPreview.swift
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 30.11.2022.
//

import Foundation
import AVFoundation
import CoreImage
import Flutter

fileprivate class VideoPreviewTexture: NSObject, FlutterTexture {
    var player: AVPlayer?
    var videoOutput: AVPlayerItemVideoOutput?
    var filters: [CIFilter] = []
    var frameUpdater: FLTFrameUpdater?
    var displayLink: CADisplayLink?
    lazy var currentContext: CIContext? = CIContext.selectVideoContext()
    
    override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(notification: )), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        player?.seek(to: CMTime.zero)
        player?.play()
    }
    
    func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
        guard let videoOutput = videoOutput else {
            return nil
        }
        let outputItemTime = videoOutput.itemTime(forHostTime: CACurrentMediaTime())
        if videoOutput.hasNewPixelBuffer(forItemTime: outputItemTime) {
            if let buffer = videoOutput.copyPixelBuffer(forItemTime: outputItemTime, itemTimeForDisplay: nil) {
                return Unmanaged.passRetained(buffer)
            }
        }
        return nil
    }
    
    func setSource(url: URL) {
        let player = self.player ?? AVPlayer()
        player.pause()
        player.actionAtItemEnd = .none
        let videoOutput = AVPlayerItemVideoOutput(pixelBufferAttributes: [
            kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA,
            kCVPixelBufferIOSurfacePropertiesKey as String : [:] ])
        
        let displayLink = CADisplayLink(target: frameUpdater, selector: #selector(FLTFrameUpdater.onDisplayLink(_:)))
        displayLink.add(to: RunLoop.current, forMode: .common)
        displayLink.isPaused = true
        
        let asset = AVAsset(url: url)
        let videoComposition = AVVideoComposition(asset: asset) { request in
            let source = request.sourceImage.clampedToExtent()
            let output = self.filters.process(source: source, extent: request.sourceImage.extent)
            request.finish(with: output ?? source,
                           context: self.filters.isEmpty ? nil : self.currentContext)
        }
        let item = AVPlayerItem(asset: asset)
        item.add(videoOutput)
        item.videoComposition = videoComposition
        
        player.replaceCurrentItem(with: item)
        player.seek(to: CMTime.zero)
        self.videoOutput = videoOutput
        self.player = player
        self.displayLink = displayLink
        self.player?.play()
        self.displayLink?.isPaused = false
    }
    
    func pause() {
        player?.pause()
    }
    
    func stop() {
        displayLink?.isPaused = true
        displayLink?.remove(from: RunLoop.current, forMode: .common)
        player?.pause()
        player = nil
        displayLink = nil
        videoOutput = nil
        frameUpdater = nil
    }
    
    func play() {
        player?.play()
    }
}

fileprivate class FLTFrameUpdater: NSObject {
    private var textureId: Int64 = 0
    private(set) weak var registry: FlutterTextureRegistry?
    
    init(textureId: Int64, registry: FlutterTextureRegistry) {
        self.registry = registry
        self.textureId = textureId
    }
    
    @objc func onDisplayLink(_ link: CADisplayLink?) {
        registry?.textureFrameAvailable(textureId)
    }
}

class VideoPreview: NSObject, VideoPreviewApi {
    
    private let registrar: FlutterPluginRegistrar
    private let filters: FiltersLocator
    
    private var previews: [Int64: VideoPreviewTexture] = [:]
    private let registry: FlutterTextureRegistry
    
    init(registrar: FlutterPluginRegistrar, filters: FiltersLocator) {
        self.registrar = registrar
        self.filters = filters
        self.registry = registrar.textures()
    }
    
    func create() throws -> Int64 {
        let preview = VideoPreviewTexture()
        let textureId = registry.register(preview)
        preview.frameUpdater = FLTFrameUpdater(textureId: textureId, registry: registry)
        previews[textureId] = preview
        return textureId
    }
    
    func connect(_ textureId: Int64, _ filters: [Int64], _ context: String) throws {
        guard let preview = previews[textureId] else {
            throw FlutterError(code: "core-image-filters", message: "Preview not found", details: nil)
        }
        preview.currentContext = CIContext.selectVideoContext(context)
        preview.filters = self.filters[filters]
    }
    
    func disconnect(_ textureId: Int64) throws {
        guard let preview = previews[textureId] else {
            throw FlutterError(code: "core-image-filters", message: "Preview not found", details: nil)
        }
        preview.currentContext = nil
        preview.filters = []
    }
    
    func setSource(_ textureId: Int64, asset: String) throws  {
        #if os(iOS)
        let assetKey = registrar.lookupKey(forAsset: asset)
        
        guard let path = Bundle.main.path(forResource: assetKey, ofType: nil) else {
            throw FlutterError(code: "core-image-filters", message: "Asset not found", details: nil)
        }
        try setSource(textureId, path: path)
        #else
        try setSource(textureId, path: asset)
        #endif
    }
    
    func setSource(_ textureId: Int64, path: String) throws {
        guard let preview = previews[textureId] else {
            throw FlutterError(code: "core-image-filters", message: "Preview not found", details: nil)
        }
        let url = URL(fileURLWithPath: path)
        preview.setSource(url: url)
    }
    
    func resume(_ textureId: Int64) throws {
        guard let preview = previews[textureId] else {
            throw FlutterError(code: "core-image-filters", message: "Preview not found", details: nil)
        }
        preview.play()
    }
    
    func pause(_ textureId: Int64) throws {
        guard let preview = previews[textureId] else {
            throw FlutterError(code: "core-image-filters", message: "Preview not found", details: nil)
        }
        preview.pause()
    }
    
    func dispose(_ textureId: Int64) throws {
        let preview = previews.removeValue(forKey: textureId)
        preview?.filters = []
        preview?.stop()
    }
}
