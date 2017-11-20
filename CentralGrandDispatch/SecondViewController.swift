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
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchImage()

    }
    
    fileprivate func fetchImage() {
        imageURL = URL(string: "http://www.dreamline.com/media/images/72_WM/Unidoor_SD12_28D_SB_72_WM.jpg")
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
        self.image = UIImage(data: imageData)

    }

}
