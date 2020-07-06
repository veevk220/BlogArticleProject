//
//  ArticleTableViewCell.swift
//  BlogArticles
//
//  Created by Vivek on 03/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var TimeUploaded: UILabel!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserDesignation: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var ArticleContent: UILabel!
    @IBOutlet weak var ArticleTitle: UILabel!
    @IBOutlet weak var ArticleLink: UITextView!
    @IBOutlet weak var ArticleLikes: UILabel!
    @IBOutlet weak var ArticleComments: UILabel!
    
    // MARK: - Functions
    
}
