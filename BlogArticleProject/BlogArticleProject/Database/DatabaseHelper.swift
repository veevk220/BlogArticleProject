//
//  DatabaseHelper.swift
//  BlogArticles
//
//  Created by Vivek on 04/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//

import UIKit
import CoreData

class DatabaseHelper: NSObject {
    
    // MARK: - Enum
    enum DatabaseTable: String {
        case Article = "ArticleEntity"
        case User = "UserEntity"
        case Media = "MediaEntity"
    }
    
    // MARK: - Properties
    
    static let shared = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    // MARK: - Initialiser
    
    private override init() {
        // Making private initialiser to make singleton
    }
    
    // MARK: - Function
    
    func syncDataBase(articleList: [Article]) {
        
        guard let context = context else { return }
        
        self.clearDatabase()
        
        for article in articleList {
            if let articleDbEntry = NSEntityDescription.insertNewObject(forEntityName: DatabaseTable.Article.rawValue, into: context) as? ArticleEntity {
                
                articleDbEntry.id = article.id
                articleDbEntry.createdAt = article.createdAt
                print("article.createdAt \(String(describing: article.createdAt))")
                articleDbEntry.content = article.content
                
                if let likes = article.likes {
                    articleDbEntry.likes = NSNumber(integerLiteral: likes).int64Value
                }
                
                if let comments = article.comments {
                    articleDbEntry.comments = NSNumber(integerLiteral: comments).int64Value
                }
                
                if let usersList = self.getUsersEntity(userList: article.user) {
                    articleDbEntry.users = NSSet(array: usersList)
                    
                }
                
                if let mediaList =  self.getMediaEntity(mediaList: article.media) {
                    articleDbEntry.medias = NSSet(array: mediaList)
                    
                }
                self.saveContext()
            }
        }
    }
    
    func getDBArticles() -> [ArticleEntity]? {
        
        guard let articleList = self.fetchAllObjectsOfEntity(entity: DatabaseTable.Article) as? [ArticleEntity] else {
            return nil
        }
        return articleList
    }
    
    // MARK: - Private Function

    private func clearDatabase() {
        self.deleteAllObjectsOfEntity(entity: DatabaseTable.Article)
        self.deleteAllObjectsOfEntity(entity: DatabaseTable.User)
        self.deleteAllObjectsOfEntity(entity: DatabaseTable.Media)
    }
    
    private func deleteAllObjectsOfEntity(entity: DatabaseTable) {
        
        guard let context = context else { return  }
        
        if let articleList = self.fetchAllObjectsOfEntity(entity: DatabaseTable.Article) as? [ArticleEntity] {
            for article in articleList {
                context.delete(article)
            }
        }
        
        if let userList = self.fetchAllObjectsOfEntity(entity: DatabaseTable.User) as? [UserEntity] {
            for user in userList {
                context.delete(user)
            }
        }
        
        if let mediaList = self.fetchAllObjectsOfEntity(entity: DatabaseTable.Media) as? [MediaEntity] {
            for media in mediaList {
                context.delete(media)
            }
        }
        
        self.saveContext()
    }
    
    private func fetchAllObjectsOfEntity(entity: DatabaseTable) -> [NSManagedObject]? {
        
        guard let context = context else { return nil }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: entity.rawValue)
        do {
            if let entityList = try context.fetch(fetchRequest) as? [NSManagedObject] {
                return entityList
            }
        } catch {
            print("Error getting database data")
        }
        return nil
    }
    
    private func getUsersEntity(userList: [User]?) -> [UserEntity]? {
        
        guard let context = context, let userList = userList else { return nil }
        
        var userDBEntryList = [UserEntity]()
        
        for user in userList {
            if let userDbEntry = NSEntityDescription.insertNewObject(forEntityName: DatabaseTable.User.rawValue, into: context) as? UserEntity {
                userDbEntry.id = user.id
                userDbEntry.blogId = user.blogId
                userDbEntry.createdAt = user.createdAt
                userDbEntry.name = user.name
                userDbEntry.avatar = user.avatar
                userDbEntry.lastname = user.lastname
                userDbEntry.city = user.city
                userDbEntry.designation = user.designation
                userDbEntry.about = user.about
                
                self.saveContext()
                
                userDBEntryList.append(userDbEntry)
            }
        }
        return userDBEntryList
    }
    
    private func getMediaEntity(mediaList:[Media]?) -> [MediaEntity]? {
        
        guard let context = context, let mediaList = mediaList else { return nil }
        
        var mediaDBEntryList = [MediaEntity]()
        
        for media in mediaList {
            if let mediaDbEntry = NSEntityDescription.insertNewObject(forEntityName: DatabaseTable.Media.rawValue, into: context) as? MediaEntity {
                mediaDbEntry.id = media.id
                mediaDbEntry.createdAt = media.createdAt
                mediaDbEntry.image = media.image
                mediaDbEntry.title = media.title
                mediaDbEntry.url = media.url
                self.saveContext()
                
                mediaDBEntryList.append(mediaDbEntry)
            }
        }
        return mediaDBEntryList
    }
    
    private func saveContext () {
        guard let context = context else { return  }
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error updating database")
            }
        }
    }
    
}
