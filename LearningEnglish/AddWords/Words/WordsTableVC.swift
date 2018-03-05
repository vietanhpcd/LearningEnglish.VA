//
//  WordsTableVC.swift
//  LearningEnglish
//
//  Created by vietanh on 3/3/18.
//  Copyright © 2018 BigZero. All rights reserved.
//

import UIKit

class WordsTableVC: UITableViewController {
    
    @IBOutlet weak var textMenu: UITextField!
    @IBOutlet weak var recorder: UIButton!
    @IBOutlet weak var audio: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var textWords: UITextField!
    @IBOutlet weak var textTranscribe: UITextField!
    @IBOutlet weak var textThink: UITextField!
    @IBOutlet weak var textForExample: UITextField!
    @IBOutlet weak var textThinkForExample: UITextField!
    
    var imagePicker = UIImagePickerController()
    var imageView = UIView()
    
    var accessRecorders = Recorder()
    
    var dataObjectMenu: String = ""
    var dataColor: UIColor = UIColor.blue
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textMenu.text = dataObjectMenu
        self.textMenu.backgroundColor = dataColor
        
        accessRecorders.setupRecorder()
        
        audio.isHidden = true
        
    }

    @IBAction func actionAudio(_ sender: UIButton) {
        accessRecorders.playAudio()
    }
    
    @IBAction func actionRecorder(_ sender: UIButton) {
        if accessRecorders.audioRecorder == nil {
            accessRecorders.startRecorder()
            recorder.setTitle("", for: .normal)
        } else {
            accessRecorders.stopRecorder()
            recorder.setTitle("", for: .normal)
            audio.isHidden = false
        }
    }
    
    @IBAction func actionTakePhoto(_ sender: UIButton) {
        let alertViewController = UIAlertController(title: "", message: "Choose your option", preferredStyle: .actionSheet)
        alertViewController.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(alert) in self.openCamera() }))
        alertViewController.addAction(UIAlertAction(title: "Gallery", style: .default, handler: {(alert) in self.openGallary() }))
        alertViewController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert) in }))
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    
    // MARK: - Row Height cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var heightTableView = UIScreen.main.bounds.size.height - 10 - UIApplication.shared.statusBarFrame.height
        if let tabBarController = tabBarController {
            heightTableView = heightTableView - tabBarController.tabBar.frame.size.height
        }
        if let navigationController = navigationController {
            heightTableView = heightTableView - navigationController.navigationBar.frame.size.height
        }
        switch indexPath.row {
        case 1:
            return heightTableView  * 5 / 12
        default:
            return heightTableView / 12
        }
    }
}


extension WordsTableVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        } else {
            let alertWarningCamera = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alertWarningCamera.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert) in }))
            self.present(alertWarningCamera, animated: true, completion: nil)
        }
    }
    
    func openGallary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        } else {
            let alertWarningGallary = UIAlertController(title: "Warning", message: "You don't have photo Library", preferredStyle: .alert)
            alertWarningGallary.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert) in }))
            self.present(alertWarningGallary, animated: true, completion: nil)
        }
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // Set photoImageView to display the selected image.
        image.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    

}













