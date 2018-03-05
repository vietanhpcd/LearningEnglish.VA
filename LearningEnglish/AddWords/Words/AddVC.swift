//
//  AddVC.swift
//  LearningEnglish
//
//  Created by vietanh on 3/5/18.
//  Copyright © 2018 BigZero. All rights reserved.
//

import UIKit

class AddVC: UIViewController {
    
    static var instance: AddVC {
        let storyboard = UIStoryboard(name: "AddWords", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "AddVC") as! AddVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addVC(_ sender: UIButton) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
