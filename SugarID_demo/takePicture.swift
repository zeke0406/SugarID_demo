//
//  takePicture.swift
//  SugarID_demo
//
//  Created by Aries Rong on 10/25/20.
//  Copyright © 2020 Zeke Rong. All rights reserved.
//

import UIKit

class takePicture: UIViewController {
   

    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var picbutton: UIButton!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.backgroundColor = .secondarySystemBackground

       }
    
    @IBAction func didTapButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
        
    }
    
}
    
    

extension takePicture: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
