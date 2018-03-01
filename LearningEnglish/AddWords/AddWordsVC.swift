//
//  AddWordsVC.swift
//  LearningEnglish
//
//  Created by vietanh on 2/27/18.
//  Copyright © 2018 BigZero. All rights reserved.
//

import UIKit

class AddWordsVC: UIViewController {

    var pageVC: PageVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        NotificationCenter.default.addObserver(self, selector: #selector(Notifications(notification:)), name: NSNotification.Name.init(rawValue: "PostSideMenu"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @objc func Notifications(notification: Notification) {
//        if let selectSideMenu = notification.userInfo {
//            let locationInMenu = selectSideMenu["Key"] as! Int
//            pageVC?.jump(toIndex: locationInMenu, animated: true)
//        }
//    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pageVC" {
            pageVC = segue.destination as? PageVC
        }
    }


}
