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

        scrollView.minimumZoomScale = 0.1
        
        scrollView.maximumZoomScale = 6.0

    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]){

        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
        
            imageView.image = image
            
            showPickedImage(imageView: imageView)

        
        } else if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imageView.image = image
            
            showPickedImage(imageView: imageView)

        } else {
            
            print("Something went wrong with photo you choose")
        }
        
        placeHolderImageView.isHidden = true
        
        self.dismiss(animated: true, completion: nil)
    }

    func showPickedImage(imageView: UIImageView){
        
        imageView.isHidden = false
        
        let scaleWidth = scrollView.frame.size.width / (imageView.image?.size.width)!
        
        let scaleHeight = scrollView.frame.size.height / (imageView.image?.size.height)!
        
        let minScale = min(scaleHeight, scaleWidth)

        scrollView.zoomScale = minScale
        
        scrollView.contentInset.top = 40
        
        scrollView.contentInset.left = 0
    
    }

    // keep image center after zooming
    func scrollViewDidZoom(_ scrollView: UIScrollView) {

        if imageView.frame.height <= scrollView.frame.height {
            
            let shiftHeight = scrollView.frame.height/2.0 - scrollView.contentSize.height/2.0
            
            scrollView.contentInset.top = shiftHeight

        } else {

            scrollView.contentInset.top = 0

        }
        if imageView.frame.width <= scrollView.frame.width {
            
            let shiftWidth = scrollView.frame.width/2.0 - scrollView.contentSize.width/2.0
            
            scrollView.contentInset.left = shiftWidth

        } else {

            scrollView.contentInset.top = 0

        }
    }
    

}
