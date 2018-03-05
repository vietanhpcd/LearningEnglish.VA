//
//  AddView.swift
//  LearningEnglish
//
//  Created by vietanh on 3/5/18.
//  Copyright © 2018 BigZero. All rights reserved.
//

import UIKit

class AddView: UIView {

    @IBAction func addVC(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name.init("PostDataInsertArrayMenu"), object: nil, userInfo: ["key": " "])
    }
}
