//
//  PickImageViewController.swift
//  OneImageViewer
//
//  Created by 蘇冠禎 on 2017/7/21.
//  Copyright © 2017年 蘇冠禎. All rights reserved.
//

import UIKit

class PickImageViewController: UIViewController, UIScrollViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var pickImageBtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var placeHolderImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func pickImageAction(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            print("Let's pick an image!")
            
            imagePicker.delegate = self
           
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isHidden = true
    
        pickImageBtn.addShadowToView(alpha: 0.25, offsetWidth: 0, offsetHeight: 2, radius: 4)
        
        scrollView.delegate = self
        
        scrollView.minimumZoomScale = 0.5

        scrollView.maximumZoomScale = 6.0
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]){

        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
        
            imageView.image = image
            
            imageView.isHidden = false
        
        } else if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imageView.image = image
            
            imageView.isHidden = false
        
        } else {
            
            print("Something went wrong with photo you choose")
        }
        
        placeHolderImageView.isHidden = true
        
        self.dismiss(animated: true, completion: nil)
    }
}
