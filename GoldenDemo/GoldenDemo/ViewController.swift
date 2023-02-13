//
//  ViewController.swift
//  GoldenDemo
//
//  Created by Nikolay Dymura on 10.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var filtersTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Filters"

        filtersTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        filtersTable.dataSource = self
        filtersTable.delegate = self
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "previewVC") as? PreviewController else {
            return
        }
        if indexPath.row < failedFilters.count {
            vc.filter = failedFilters[indexPath.row].filter
        } else {
            vc.filter = approvedFilters[indexPath.row - failedFilters.count].filter
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return failedFilters.count + approvedFilters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row < failedFilters.count {
            aCell.textLabel?.text = failedFilters[indexPath.row].displayName
            aCell.textLabel?.textColor = .red
        } else {
            aCell.textLabel?.text = approvedFilters[indexPath.row - failedFilters.count].displayName
            aCell.textLabel?.textColor = .green
        }
        return aCell
    }
}


class PreviewController: UIViewController {
    
    fileprivate var filter: CIFilter!
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let name = filter.attributes["CIAttributeFilterName"] as? String else {
            return
        }
        
        title = name
        
        processImage(named: "demo.jpeg")
    }
    
    func displayDefaultContext(outputImage: CIImage) {
        let context = CIContext()
        let colorSpace = context.currentColorSpace
        
        guard let data = context.jpegRepresentation(of: outputImage, colorSpace: outputImage.colorSpace ?? colorSpace,
                                                    options: [CIImageRepresentationOption(rawValue: kCGImageDestinationLossyCompressionQuality as String): 1.0])  else {
            return
        }
        imageView1.image = UIImage(data: data)

    }
    
    func displayOpenGLContext(outputImage: CIImage) {
        let context = CIContext(eaglContext: EAGLContext(api: .openGLES2)!, options: [
            CIContextOption.priorityRequestLow : true,
            CIContextOption.workingColorSpace: NSNull(),
            CIContextOption.outputColorSpace: NSNull(),
        ])
        let colorSpace = context.currentColorSpace
        
        guard let data = context.jpegRepresentation(of: outputImage, colorSpace: outputImage.colorSpace ?? colorSpace,
                                                    options: [CIImageRepresentationOption(rawValue: kCGImageDestinationLossyCompressionQuality as String): 1.0])  else {
            return
        }
        imageView2.image = UIImage(data: data)
    }

    func displayMLTContext(outputImage: CIImage) {
        let context = CIContext(mtlDevice: MTLCreateSystemDefaultDevice()!, options: [
            CIContextOption.priorityRequestLow : true,
            CIContextOption.workingColorSpace: NSNull(),
            CIContextOption.outputColorSpace: NSNull(),
        ])
        let colorSpace = context.currentColorSpace
        
        guard let data = context.jpegRepresentation(of: outputImage, colorSpace: outputImage.colorSpace ?? colorSpace,
                                                    options: [CIImageRepresentationOption(rawValue: kCGImageDestinationLossyCompressionQuality as String): 1.0])  else {
            return
        }
        imageView3.image = UIImage(data: data)
    }
    
    func processImage(named: String) {
        guard let sourceImage = UIImage(named: named) else {
            return
        }
        if filter.inputKeys.contains(kCIInputImageKey) {
            guard let inputImage = CIImage(image: sourceImage) else {
                return
            }
            
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            
            guard var image = filter.outputImage else {
                return
            }
            if image.extent.isInfinite {
                image = image.cropped(to: inputImage.extent)
            }
            displayDefaultContext(outputImage: image)
            displayOpenGLContext(outputImage: image)
            displayMLTContext(outputImage: image)
        } else {
            guard var image = filter.outputImage else {
                return
            }
            if image.extent.isInfinite {
                image = image.cropped(to: CGRect(x: 0, y: 0, width: 300, height: 300))
            }
            displayDefaultContext(outputImage: image)
            displayOpenGLContext(outputImage: image)
            displayMLTContext(outputImage: image)
        }
    }
    
    @IBAction func demoTap(_ sender: Any) {
        processImage(named: "demo.jpeg")
    }
    
    @IBAction func demoRedTap(_ sender: Any) {
        processImage(named: "demo-red.jpeg")
    }
    
    @IBAction func demoGreenTap(_ sender: Any) {
        processImage(named: "demo-green.jpeg")
    }
    
    @IBAction func demoBlueTap(_ sender: Any) {
        processImage(named: "demo-blue.jpeg")
    }
    
    @IBAction func demoWhiteTap(_ sender: Any) {
        processImage(named: "demo-white.jpeg")
    }
    
    @IBAction func demoBlackTap(_ sender: Any) {
        processImage(named: "demo-black.jpeg")
    }
    
    
    
}

extension CIContext {
    var currentColorSpace: CGColorSpace {
        return workingColorSpace ?? CGColorSpace(name: CGColorSpace.sRGB)!
    }
}
