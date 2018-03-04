//
//  TakePhoto.swift
//  LearningEnglish
//
//  Created by vietanh on 3/4/18.
//  Copyright © 2018 BigZero. All rights reserved.
//

import UIKit

class Camera: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    var imageView = UIImage()
    
    let alertWarningCamera = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
    let alertWarningGallary = UIAlertController(title: "Warning", message: "You don't have photo Library", preferredStyle: .alert)
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
        } else {
            alertWarningCamera.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert) in }))
        }
    }
    
    func openGallary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
        } else {
            alertWarningGallary.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert) in }))
        }
    }
}
