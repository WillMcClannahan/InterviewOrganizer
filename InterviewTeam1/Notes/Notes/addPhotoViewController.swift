//
//  ChoosePhotoViewController.swift
//  addPhotoFunction
//
//  Created by Jessica Dean on 5/14/19.
//  Copyright © 2019 missouri.edu. All rights reserved.
//

import UIKit

class addPhotoViewController: UIViewController {
    
    
    @IBOutlet weak var img: UIImageView!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func PickImage(_ sender: Any) {
    
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    
}

extension addPhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            img.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
}
