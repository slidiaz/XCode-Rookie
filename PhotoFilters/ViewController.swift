//
//  ViewController.swift
//  PhotoFilters
//
//  Created by Stephanie Li-Diaz on 8/17/15.
//  Copyright (c) 2015 Stephanie Li-Diaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    //Create a place to render the filtered image 
    let context = CIContext(options:nil)
    @IBAction func applyFilter(sender: AnyObject) {
        
        
        // Create an image to a filter
        let inputImage = CIImage(image: photoImageView.image)
        
        
        // Create a random color to pass to a filter
        let randomColor = [kCIInputAngleKey:(Double(arc4random_uniform(314)) / 100) ]
        
        //Apply a filter to the image
        let filteredImage = inputImage.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        
        
        //Render the filter image
        let renderedImage = context.createCGImage(filteredImage, fromRect: filteredImage.extent())
        
        //Reflect the change back to the interface
        photoImageView.image = UIImage(CGImage: renderedImage)
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("Testing ")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

