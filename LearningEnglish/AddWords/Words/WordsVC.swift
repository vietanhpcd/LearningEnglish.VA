//
//  WordsN.swift
//  LearningEnglish
//
//  Created by vietanh on 2/27/18.
//  Copyright © 2018 BigZero. All rights reserved.
//

import UIKit
import AVFoundation

class WordsVC: UIViewController {
    
    @IBOutlet weak var recorder: UIButton!
    @IBOutlet weak var audio: UIButton!
    @IBOutlet weak var labelMenu: UILabel!
    @IBOutlet weak var addView: UIView!
    
    var accessRecoders = Recorder()
    
    var dataObjectMenu: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelMenu.text = dataObjectMenu
        self.labelMenu.backgroundColor = pickerColorMenu(dataObjectMenu)
        
        accessRecoders.setupRecorder()
        audio.isHidden = true
        
        addView.isHidden = true
        if dataObjectMenu == "?" {
            addView.isHidden = false
        }
    }

    @IBAction func actionRecorder(_ sender: UIButton) {
        // Check if we have an active recorder
        if accessRecoders.audioRecorder == nil {
            accessRecoders.startRecorder()
            recorder.setTitle("", for: .normal)
            audio.isHidden = true
        } else {
            accessRecoders.stopRecorder()
            recorder.setTitle("", for: .normal)
            audio.isHidden = false
        }
    }
    
    @IBAction func actionAudio(_ sender: UIButton) {
        accessRecoders.playAudio()
    }
    
    @IBAction func hiddenAddView(_ sender: UIButton) {
        addView.isHidden = true
    }
    
    func pickerColorMenu(_ namne: String) -> UIColor {
        switch namne {
        case "N":
            return UIColor.blue
        case "V":
            return UIColor.red
        case "Adj":
            return UIColor.purple
        case "Adv":
            return UIColor.orange
        default:
            return UIColor.brown
        }
    }
}
