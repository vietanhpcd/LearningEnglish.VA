//
//  WebVC.swift
//  LearningEnglish
//
//  Created by vietanh on 3/5/18.
//  Copyright © 2018 BigZero. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url  = URL(string: "https://translate.google.com/?hl=vi")
        let request = URLRequest(url: url!)
        
        webview.load(request)
    }
}
