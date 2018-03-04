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
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> WordsTableVC? {
        // Return the data view controller for the given index.
        if (self.dataMenu.count == 0) || (index >= self.dataMenu.count) {
            return nil
        }
        // Create a new view controller and pass suitable data.
        let dataWordsVC = storyboard.instantiateViewController(withIdentifier: "WordsTableVC") as! WordsTableVC
        dataWordsVC.dataObjectMenu = self.dataMenu[index]
        dataWordsVC.dataColor = pickerColorMenu(index)
        return dataWordsVC
    }
    
    func indexOfViewController(_ viewController: WordsTableVC) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return dataMenu.index(of: viewController.dataObjectMenu) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! WordsTableVC)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! WordsTableVC)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.dataMenu.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    // MARK: - Color Menu in WordsTableVC
    func pickerColorMenu(_ index: Int) -> UIColor {
        switch index {
        case 0:
            return UIColor.blue
        case 1:
            return UIColor.red
        case 2:
            return UIColor.purple
        case 3:
            return UIColor.orange
        default:
            return UIColor.brown
        }
    }
}
