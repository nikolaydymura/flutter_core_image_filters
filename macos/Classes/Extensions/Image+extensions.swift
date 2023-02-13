//
//  Image+extensions.swift
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 01.12.2022.
//
import Foundation
import Accelerate


extension CGImage {
    func createBitmap(colorSpace: CGColorSpace) -> UnsafeMutablePointer<UInt8>? {

      let width = width
      let height = height

      let bitsPerComponent = 8
      let bytesPerRow = width * 4

      let bitmapSize = bytesPerRow * height

      guard let data = malloc(bitmapSize) else {
        return nil
      }

      guard let context = CGContext(
        data: data,
        width: width,
        height: height,
        bitsPerComponent: bitsPerComponent,
        bytesPerRow: bytesPerRow,
        space: colorSpace,
        bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue,
        releaseCallback: nil,
        releaseInfo: nil) else {
          return nil
      }

      context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))

      return data.bindMemory(to: UInt8.self, capacity: bitmapSize)
    }
}

extension CIImage {
    func buildCGImage() -> CGImage? {
        let context = CIContext(options: nil)
        return context.createCGImage(self, from: self.extent)
    }
    
    public func cubeData(dimension: Int, colorSpace: CGColorSpace) -> (Data?, String?) {

      guard let cgImage = cgImage ?? buildCGImage() else {
          return (nil, "Missing Image Data \(#line)")
      }

      guard let bitmap = cgImage.createBitmap(colorSpace: colorSpace) else {
          return (nil, "Missing Image Data \(#line)")
      }

      let width = cgImage.width
      let height = cgImage.height
      let rowNum = width / dimension
      let columnNum = height / dimension

      let dataSize = dimension * dimension * dimension * MemoryLayout<Float>.size * 4

      var array = Array<Float>(repeating: 0, count: dataSize)

      var bitmapOffest: Int = 0
      var z: Int = 0

      for _ in stride(from: 0, to: rowNum, by: 1) {
        for y in stride(from: 0, to: dimension, by: 1) {
          let tmp = z
          for _ in stride(from: 0, to: columnNum, by: 1) {
            for x in stride(from: 0, to: dimension, by: 1) {

              let dataOffset = (z * dimension * dimension + y * dimension + x) * 4

              let position = bitmap
                .advanced(by: bitmapOffest)

              array[dataOffset + 0] = Float(position
                .advanced(by: 0)
                .pointee) / 255

              array[dataOffset + 1] = Float(position
                .advanced(by: 1)
                .pointee) / 255

              array[dataOffset + 2] = Float(position
                .advanced(by: 2)
                .pointee) / 255

              array[dataOffset + 3] = Float(position
                .advanced(by: 3)
                .pointee) / 255
              
              bitmapOffest += 4
              
            }
            z += 1
          }
          z = tmp
        }
        z += columnNum
      }

      free(bitmap)
      
      let data = Data.init(bytes: array, count: dataSize)
      return (data, nil)
    }
}

extension CIImage {
    
    public func cubeData(dimension: Int) -> (NSData?, String?) {
        
        // Set up some variables for calculating memory size.
        let imageSize = extent
        let dim = Int(imageSize.width)
        let pixels = dim * dim
        let channels = 4
        
        // If the number of pixels doesn't match what's needed for the supplied cube dimension, abort.
        guard pixels == dimension * dimension * dimension else {
            return (nil, "Incorrect Image Size \(pixels) vs \(dimension * dimension * dimension)")
        }
        
        // We don't need a sizeof() because uint_8t is explicitly 1 byte.
        let memSize = pixels * channels
        
        // Get the UIImage's backing CGImageRef
        guard let img = cgImage ?? buildCGImage() else {
            return (nil, "Missing Image Data \(#line)")
        }
        
        // Get a reference to the CGImage's data provider.
        guard let inProvider = img.dataProvider else {
            return (nil, "Missing Image Data \(#line)")
        }
        
        let inBitmapData = inProvider.data
        guard let inBuffer = CFDataGetBytePtr(inBitmapData) else {
            return (nil, "Missing Image Data \(#line)")
        }
        
        // Calculate the size of the float buffer and allocate it.
        let floatSize = memSize *  MemoryLayout<Float>.size
        let finalBuffer = unsafeBitCast(malloc(floatSize), to: UnsafeMutablePointer<Float>.self)
        
        // Convert the uint_8t to float. Note: a uint of 255 will convert to 255.0f.
        vDSP_vfltu8(inBuffer, 1, finalBuffer, 1, UInt(memSize))
        
        // Divide each float by 255.0 to get the 0-1 range we are looking for.
        var divisor = Float(255.0)
        vDSP_vsdiv(finalBuffer, 1, &divisor, finalBuffer, 1, UInt(memSize))
        
        // Don't copy the bytes, just have the NSData take ownership of the buffer.
        let cubeData = NSData(bytesNoCopy: finalBuffer, length: floatSize, freeWhenDone: true)
        
        return (cubeData, nil)
        
    }
}
