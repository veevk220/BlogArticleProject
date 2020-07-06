//
//  PageViewController.swift
//  BlogArticles
//
//  Created by Vivek on 05/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var activityIndicatorView: UIView!
    @IBOutlet private weak var infoLable: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    var viewControllerList : [UIViewController]?
    
    // MARK: - View Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareView()
    }
    
    func prepareView() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.title = "Articles"
        
        self.dataSource = self
        self.view.backgroundColor = UIColor.white
        
        activityIndicatorView.center = self.view.center
        self.view.addSubview(activityIndicatorView)
    }
    
    // MARK: - Static Methods
    
    static func getViewController() -> PageViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let pageViewController = storyboard.instantiateViewController(withIdentifier: "PageViewController") as? PageViewController else { return nil }
        return pageViewController
    }
    
    // MARK: - Private Methods
    
    private func preparePageViewController() {
        if let firstViewController = self.viewControllerList?.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
            self.activityIndicatorView.isHidden = true
            
        } else {
            self.activityIndicator.isHidden = true
            self.infoLable.text = "No contents to display"
        }
    }
    
}

// MARK: - PageView Extension

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerList = self.viewControllerList , let currentIndex = viewControllerList.firstIndex(of: viewController) else { return nil }
        
        if currentIndex >= 1 {
            return viewControllerList[currentIndex - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerList = self.viewControllerList , let currentIndex = viewControllerList.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < viewControllerList.count - 1  {
            return viewControllerList[currentIndex + 1]
        }
        return nil
    }
    
    
}

