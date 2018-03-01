//
//  CustomView.swift
//  LearningEnglish
//
//  Created by vietanh on 2/27/18.
//  Copyright © 2018 BigZero. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.tag = Int(newValue)
            layer.cornerRadius = self.tag == -1 ? (frame.width / 2) : CGFloat(self.tag)
            clipsToBounds = true
        }
        get {
            return CGFloat(self.tag)
        }
    }
}

