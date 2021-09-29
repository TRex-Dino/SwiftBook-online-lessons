//
//  ImageViewController.swift
//  LoginApp
//
//  Created by Alexey Efimov on 05.04.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 2
        }
    }
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: user.person.image)
    }
}
