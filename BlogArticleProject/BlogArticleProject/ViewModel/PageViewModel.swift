//
//  pageViewModel.swift
//  BlogArticles
//
//  Created by Vivek on 05/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//
import UIKit

// MARK: - Page View Model Protocol

protocol PageViewModelProtocol {
    func viewControllerList(viewControllerList: [ArticleViewController]?)
}

class PageViewModel: NSObject {
    
    // MARK: - Properties
    
    let numberOfElementsPerPage: Int = 10
    var delegate: PageViewModelProtocol
    var articleList: [Article]?
    
    // MARK: - Initialiser
    
    init(delegate: PageViewModelProtocol) {
        self.delegate = delegate
    }
    
    // MARK: - Functions
    
    func getControllerList() {
        
        ServiceHelper.sharedInstance.callAPI(urlString: ServiceHelper.APIURL.articleAPI.rawValue) {  (data, result) in
            if result {
                guard let data = data else {
                    self.prepareViewControllers(articleList: nil)
                    return
                }
                do {
                    let articleArray = try JSONDecoder().decode([Article].self, from: data)
                    DatabaseHelper.shared.syncDataBase(articleList: articleArray)
                    self.prepareViewControllers(articleList: articleArray)
                } catch {
                    self.prepareViewControllers(articleList: nil)
                }
            } else {
                
                var articleArray = [Article]()
                if let articleEntityArray = DatabaseHelper.shared.getDBArticles() {
                    for articleDBElement in articleEntityArray {
                        let article = articleDBElement.convertToStruct()
                        articleArray.append(article)
                    }
                }
                self.prepareViewControllers(articleList: articleArray)
            }
        }
    }
    
    private func prepareViewControllers(articleList: [Article]?) {
        var viewControllerArray = [ArticleViewController]()
        guard var articleArray = articleList else { return }
        
        repeat {
            let elementIndexRange: Int = articleArray.count >= self.numberOfElementsPerPage ? self.numberOfElementsPerPage : articleArray.count
            
            guard let articleVC = ArticleViewController.getViewController() else { return }
            
            articleVC.articleArray = Array(articleArray[0..<elementIndexRange])
            viewControllerArray.append(articleVC)
            articleArray = Array(articleArray.dropFirst(elementIndexRange))
            
        }while articleArray.count > 0
        
        self.delegate.viewControllerList(viewControllerList: viewControllerArray)
    }
}
