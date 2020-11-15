//
//  WalkthroughPageViewController.swift
//  Arthritis App
//
//  Created by Danielle Ribeiro on 2020-10-31.
//  Copyright © 2020 Danielle Ribeiro. All rights reserved.
//

import UIKit

protocol WalkthroughPageViewControllerDelegate:class {
    func didUpdatePageIndex(currentIndex: Int)
    
}


class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    //MARK properties
    weak var walkthroughDelegate: WalkthroughPageViewControllerDelegate?
    
    
    var pageHeadings = ["LEARN", "PROGRESS", "ABOUT"]
    var pageImages = ["open-book","progress", "information"]
    var pageSubHeadings = ["Learn about Rheumatoid Arthritis and different treatment methods", "Track your Range of Motion (ROM) progress", "Learn more about this app, the accompanying glove and its goal"]
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        //set the data source and the delegate to itself
        dataSource = self
        delegate = self
        
        // Create the first walkthrough screen
        if let startingViewController = contentViewController(at: 0){
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
            
            
        }
    
        
        // Do any additional setup after loading the view.
    }
    
    //MARK  - PageViewController Data source
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> WalkthroughContentViewController?{
        if index < 0 || index >= pageHeadings.count{
            return nil
        }
        // Create a new view controller and pass suitable data
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier:"WalkthroughContentViewController") as? WalkthroughContentViewController{
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }

    func forwardPage (){
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex){
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //MARK: Page View Controller Delegate
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? WalkthroughContentViewController{
                currentIndex = contentViewController.index
                
                walkthroughDelegate?.didUpdatePageIndex(currentIndex:currentIndex)
            }
        }
    }

}
