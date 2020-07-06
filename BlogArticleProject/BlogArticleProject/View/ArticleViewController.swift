//
//  ArticleViewController.swift
//  BlogArticles
//
//  Created by Vivek on 03/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var articleTableView: UITableView!
    private static let cellIdentifier = "ArticleTableViewCell"
    var articleArray: [Article]?
    
    // MARK: - Static Methods
    
    static func getViewController() -> ArticleViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let articleViewController = storyboard.instantiateViewController(withIdentifier: "ArticleViewController") as? ArticleViewController else { return nil }
        return articleViewController
    }
    
    // MARK: - View Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.articleTableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: type(of: self).cellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}

// MARK: - UITableView Extension

extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articleArray = articleArray else {
            self.articleTableView.isHidden = true
            return 0
        }
        self.articleTableView.isHidden = articleArray.count == 0
        return articleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: type(of: self).cellIdentifier) as? ArticleTableViewCell , let articleArray = articleArray else {
            return UITableViewCell()
        }
        
        cell.fillDataInCell(article: articleArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

