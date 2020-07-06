//
//  ArticleEntity+CoreDataClass.swift
//  BlogArticles
//
//  Created by Vivek on 04/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//
//

import Foundation
import CoreData


public class ArticleEntity: NSManagedObject{
    
    func convertToStruct() -> Article {
        var article = Article()
        
        article.likes =  Int(exactly: NSNumber(value: self.likes))
        article.comments =  Int(exactly: NSNumber(value: self.comments))
        article.content = self.content
        article.createdAt = self.createdAt
        article.id = self.id
        
        var userArray: [User] = []
        
        if let userList = self.users?.allObjects as? [UserEntity] {
            for userElement in userList {
                let user = userElement.convertToStruct()
                userArray.append(user)
            }
        }
        article.user = userArray
        
        var mediaArray: [Media] = []
        
        if let mediaList = self.medias?.allObjects as? [MediaEntity] {
            for mediaElement in mediaList {
                let media = mediaElement.convertToStruct()
                mediaArray.append(media)
            }
        }
        article.media = mediaArray
        
        return article
    }
    
    
}
