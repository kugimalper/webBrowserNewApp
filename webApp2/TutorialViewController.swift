//
//  TutorialViewController.swift
//  webApp2
//
//  Created by ST5 on 25.10.2017.
//  Copyright © 2017 Kugim. All rights reserved.
//
import UIKit

class TutorialViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    // FirstSliderViewController
    // SecondSliderViewController
    // ThirdSliderViewController
    
    
    lazy var viewControllerList: [UIViewController] = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController1 = storyBoard.instantiateViewController(withIdentifier: "FirstSliderViewController")
        
        let viewController2 = storyBoard.instantiateViewController(withIdentifier: "SecondSliderViewController")
        
        let viewController3 = storyBoard.instantiateViewController(withIdentifier: "ThirdSliderViewController")
        
        return [viewController1, viewController2, viewController3]
    }()
    
    lazy var notTutorialviewControllerList: [UIViewController] = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController1 = storyBoard.instantiateViewController(withIdentifier: "ViewController")
        return [viewController1]
    }()
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard viewControllerList.count > previousIndex else {
            return nil
        }
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = vcIndex + 1
        
        guard viewControllerList.count != nextIndex else {
            return nil
        }
        
        guard viewControllerList.count > nextIndex else {
            return nil
        }
        
        return viewControllerList[nextIndex]
    

    }
    
    //    func presentationCount(for pageViewController: UIPageViewController) -> Int {
    //        return viewControllerList.count
    //    }
    //
    //
    //    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    //        guard let firstViewController = viewControllers?.first,
    //            let firstViewControllerIndex = viewControllerList.index(of: firstViewController) else {
    //            return 0
    //        }
    //
    //        return firstViewControllerIndex
    //    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        
        
        if let tutorial = UserDefaults.standard.object(forKey: "Tutorial") as? Bool {
            
            searchSettings.tutorial = tutorial
        }
        
        print (searchSettings.tutorial)
        
        print (viewControllerList.last!)
        
        if searchSettings.tutorial == true {
            let firstViewController = viewControllerList.first
            self.setViewControllers([firstViewController!], direction: .forward, animated: true, completion: nil)
            
            
        }else {
            
            let firstViewController = notTutorialviewControllerList.first
            self.setViewControllers([firstViewController!], direction: .forward, animated: true, completion: nil)

            
        }
    }
    






    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
