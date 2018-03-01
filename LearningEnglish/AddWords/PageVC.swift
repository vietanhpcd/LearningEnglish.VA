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
        
        let startingVC: WordsVC = self.pageDataSource.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        self.setViewControllers([startingVC], direction: .forward, animated: false, completion: {done in })
        
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
        let currentVC = self.viewControllers![0] as! WordsVC
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
