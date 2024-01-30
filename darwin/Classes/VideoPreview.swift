//
//  VideoPreview.swift
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 30.11.2022.
//

import Foundation
import AVFoundation
import CoreImage
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

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
        #if os(macOS)
        let displayLink = CADisplayLink()
        #else
        let displayLink = CADisplayLink(target: frameUpdater, selector: #selector(FLTFrameUpdater.onDisplayLink(_:)))
        #endif
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

extension VideoPreviewTexture: FlutterStreamHandler {
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        guard let asset = player?.currentItem?.asset else {
            return nil
        }
        Task.init {
            await load(asset: asset, eventSink: events)
        }
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        return nil
    }
    
    
    func load(asset: AVAsset, eventSink: @escaping FlutterEventSink) async {
        var naturalSize: CGSize?
        var preferredTransform: CGAffineTransform?
        if #available(iOS 15.0, *) {
            guard let tracks = try? await asset.loadTracks(withMediaType: .video), let video = tracks.first else {
                return
            }

            naturalSize = try? await video.load(.naturalSize)
            preferredTransform = try? await video.load(.preferredTransform)
        } else {
            guard let video = asset.tracks(withMediaType: .video).first else {
                return
            }
            naturalSize = video.naturalSize
            preferredTransform = video.preferredTransform
        }
        if let size = naturalSize {
            if let transform = preferredTransform {
                let fixed = CGSizeApplyAffineTransform(size, transform)
                DispatchQueue.main.async {
                    eventSink(["width": fixed.width, "height": fixed.height])
                }
            } else {
                DispatchQueue.main.async {
                    eventSink(["width": size.width, "height": size.height])
                }
            }
        }
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
        #if os(macOS)
        self.registry = registrar.textures
        #else
        self.registry = registrar.textures()
        #endif
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
#if os(iOS)
        let eventChannel = FlutterEventChannel(name: "VideoPreviewTextureEvent_\(textureId)",
                                               binaryMessenger: registrar.messenger())
        
#else
        let eventChannel = FlutterEventChannel(name: "VideoPreviewTextureEvent_\(exportId)",
                                               binaryMessenger: registrar.messenger)
#endif
        eventChannel.setStreamHandler(preview)
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
