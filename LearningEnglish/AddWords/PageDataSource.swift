//
//  PageDataSource.swift
//  LearningEnglish
//
//  Created by vietanh on 2/27/18.
//  Copyright © 2018 BigZero. All rights reserved.
//

import UIKit

class PageDataSource: NSObject, UIPageViewControllerDataSource {
    
    var dataMenu = ["N","V","Adj","Adv","?"]
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> WordsVC? {
        // Return the data view controller for the given index.
        if (self.dataMenu.count == 0) || (index >= self.dataMenu.count) {
            return nil
        }
        // Create a new view controller and pass suitable data.
        let dataWordsVC = storyboard.instantiateViewController(withIdentifier: "WordsVC") as! WordsVC
        dataWordsVC.dataObjectMenu = self.dataMenu[index]
        return dataWordsVC
    }
    
    func indexOfViewController(_ viewController: WordsVC) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return dataMenu.index(of: viewController.dataObjectMenu) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! WordsVC)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! WordsVC)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.dataMenu.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
}
