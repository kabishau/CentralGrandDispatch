//
//  SecondViewController.swift
//  CentralGrandDispatch
//
//  Created by user131656 on 11/20/17.
//  Copyright © 2017 user131656. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchImage()

    }
    
    fileprivate func fetchImage() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        imageURL = URL(string: "http://www.dreamline.com/media/images/72_WM/Unidoor_SD12_28D_SB_72_WM.jpg")
        
        // removing process of loading image and updating interface from main queue to another
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            // for updating interface using the main thread
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
            
        }
    }
}
