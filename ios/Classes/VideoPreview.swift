//
//  VideoPreview.swift
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 30.11.2022.
//

import Foundation
import AVFoundation
import CoreImage

fileprivate class VideoPreviewTexture: NSObject, FlutterTexture {
    var player: AVPlayer?
    var videoOutput: AVPlayerItemVideoOutput?
    var filter: CIFilter?
    var frameUpdater: FLTFrameUpdater?
    var displayLink: CADisplayLink?
    
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
            self.filter?.setValue(source, forKey: kCIInputImageKey)
            let output = self.filter?.outputImage?.cropped(to: request.sourceImage.extent)
            request.finish(with: output ?? source, context: nil)
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

class VideoPreview: NSObject, FLTVideoPreviewApi {
    
    private let registrar: FlutterPluginRegistrar
    private let filters: FiltersLocator
    
    private var previews: [Int64: VideoPreviewTexture] = [:]
    private let registry: FlutterTextureRegistry
    
    init(registrar: FlutterPluginRegistrar, filters: FiltersLocator) {
        self.registrar = registrar
        self.filters = filters
        self.registry = registrar.textures()
    }
    
    func create(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FLTPreviewMessage? {
        let preview = VideoPreviewTexture()
        let textureId = registry.register(preview)
        preview.frameUpdater = FLTFrameUpdater(textureId: textureId, registry: registry)
        previews[textureId] = preview
        return FLTPreviewMessage.make(withTextureId: NSNumber(value: textureId))
    }
    
    func connect(_ msg: FLTBindPreviewMessage, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[msg.textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        
        guard let filter = filters[msg.filterId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        preview.filter = filter
    }
    
    func disconnect(_ msg: FLTPreviewMessage, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[msg.textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        preview.filter = nil
    }
    
    func setSource(_ msg: FLTSourcePreviewMessage, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[msg.textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        let url: URL
        if msg.asset.boolValue {
            let assetKey = registrar.lookupKey(forAsset: msg.path)
            
            guard let path = Bundle.main.path(forResource: assetKey, ofType: nil) else {
                error.pointee = FlutterError()
                return
            }
            url = URL(fileURLWithPath: path)
        } else {
            url = URL(fileURLWithPath: msg.path)
        }
        preview.setSource(url: url)
    }
    
    func resume(_ msg: FLTPreviewMessage, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[msg.textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        preview.play()
    }
    
    func pause(_ msg: FLTPreviewMessage, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[msg.textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        preview.pause()
    }
    
    func dispose(_ msg: FLTPreviewMessage, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        
        let preview = previews.removeValue(forKey: msg.textureId.int64Value)
        preview?.filter = nil
        preview?.stop()
    }
}
