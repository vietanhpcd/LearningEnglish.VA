//
//  PageVC.swift
//  LearningEnglish
//
//  Created by vietanh on 2/27/18.
//  Copyright © 2018 BigZero. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDelegate {
    
    var pageDataSource = PageDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.dataSource = pageDataSource
        
        let startingVC: WordsTableVC = self.pageDataSource.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        self.setViewControllers([startingVC], direction: .forward, animated: false, completion: {done in })
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationInsertArrayMenu(notification:)), name: NSNotification.Name.init("PostDataInsertArrayMenu"), object: nil)
    }
    
    @objc func notificationInsertArrayMenu(notification: Notification) {
        if let addData = notification.userInfo!["key"] {
            let one = pageDataSource.dataMenu.count
            pageDataSource.dataMenu.insert("\(addData)\(one)", at: one - 1)
            let index = one - 1
            let startVC: WordsTableVC = self.pageDataSource.viewControllerAtIndex(index, storyboard: self.storyboard!)!
            self.setViewControllers([startVC], direction: .forward, animated: false, completion: {done in })
        }
    }
    
    // MARK: - UIPageViewController delegate methods
    
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        if (orientation == .portrait) || (orientation == .portraitUpsideDown) || (UIDevice.current.userInterfaceIdiom == .phone) {
            // In portrait orientation or on iPhone: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to true, so set it to false here.
            let currentVC = self.viewControllers![0]
            self.setViewControllers([currentVC], direction: .forward, animated: true, completion: {dome in })
            self.isDoubleSided = false
            return .min
        }
        
        // In landscape orientation: Set set the spine location to "mid" and the page view controller's view controllers array to contain two view controllers. If the current page is even, set it to contain the current and next view controllers; if it is odd, set the array to contain the previous and current view controllers.
        let currentVC = self.viewControllers![0] as! WordsTableVC
        var viewControllers: [UIViewController]
        
        let indexOfCurrentViewController = self.pageDataSource.indexOfViewController(currentVC)
        if (indexOfCurrentViewController == 0) || (indexOfCurrentViewController % 2 == 0) {
            let nextVC = self.pageDataSource.pageViewController(self, viewControllerAfter: currentVC)
            viewControllers = [currentVC, nextVC!]
        } else {
            let previousVC = self.pageDataSource.pageViewController(self, viewControllerBefore: currentVC)
            viewControllers = [previousVC!, currentVC]
        }
        self.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })
        return .mid
    }
}
