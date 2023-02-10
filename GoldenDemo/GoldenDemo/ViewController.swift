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
        vc.filter = filters[indexPath.row].filter
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        aCell.textLabel?.text = filters[indexPath.row].displayName
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
        
        if filter.inputKeys.contains(kCIInputImageKey) {
            guard let inputImage = CIImage(image: UIImage(named: "demo.jpeg")!) else {
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
    
    func displayDefaultContext(outputImage: CIImage) {
        let context = CIContext()
        let colorSpace = (context.workingColorSpace ?? CGColorSpace(name: CGColorSpace.sRGB))!
        
        guard let data = context.jpegRepresentation(of: outputImage, colorSpace: outputImage.colorSpace ?? colorSpace)  else {
            return
        }
        imageView1.image = UIImage(data: data)

    }
    
    func displayOpenGLContext(outputImage: CIImage) {
        let context = CIContext(eaglContext: EAGLContext(api: .openGLES2)!, options: [
            CIContextOption.priorityRequestLow : true,
            CIContextOption.workingColorSpace : NSNull()
        ])
        let colorSpace = (context.workingColorSpace ?? CGColorSpace(name: CGColorSpace.sRGB))!
        
        guard let data = context.jpegRepresentation(of: outputImage, colorSpace: outputImage.colorSpace ?? colorSpace)  else {
            return
        }
        imageView2.image = UIImage(data: data)
    }

    func displayMLTContext(outputImage: CIImage) {
        let context = CIContext(mtlDevice: MTLCreateSystemDefaultDevice()!, options: [
            CIContextOption.priorityRequestLow : true,
            CIContextOption.workingColorSpace : NSNull()
        ])
        let colorSpace = (context.workingColorSpace ?? CGColorSpace(name: CGColorSpace.sRGB))!
        
        guard let data = context.jpegRepresentation(of: outputImage, colorSpace: outputImage.colorSpace ?? colorSpace)  else {
            return
        }
        imageView3.image = UIImage(data: data)
    }
}
