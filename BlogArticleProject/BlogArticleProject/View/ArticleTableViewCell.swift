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
    
    func fillDataInCell(article: Article) {
        
        self.ArticleLink.contentInset = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 0)
        
        self.UserImage.setImageByURL(urlString: article.user?.first?.avatar, placeholderImage: nil)
        self.TimeUploaded.text = article.createdAt?.toDate()
        
        self.UserDesignation.text = article.user?.first?.designation
        self.articleImage.setImageByURL(urlString: article.media?.first?.image, placeholderImage: nil)
        self.ArticleContent.text = article.content
        self.ArticleTitle.text = article.media?.first?.title
        self.ArticleLink.text = article.media?.first?.url
        
        if let likeCount = article.likes {
            self.ArticleLikes.text = "\(likeCount.convertToProperCount()) Likes"
        }
        
        if let commentsCount = article.comments {
            self.ArticleComments.text = "\(commentsCount.convertToProperCount()) Comments"
        }
        
        if let firstName = article.user?.first?.name, let lastName = article.user?.first?.lastname {
            self.UserName.text = "\(firstName) \(lastName)"
        }
    }

}
