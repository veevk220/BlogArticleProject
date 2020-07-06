//
//  ArticleEntity+CoreDataProperties.swift
//  BlogArticles
//
//  Created by Vivek on 04/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//
//

import Foundation
import CoreData


extension ArticleEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleEntity> {
        return NSFetchRequest<ArticleEntity>(entityName: "ArticleEntity")
    }

    @NSManaged public var comments: Int64
    @NSManaged public var content: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var id: String?
    @NSManaged public var likes: Int64
    @NSManaged public var users: NSSet?
    @NSManaged public var medias: NSSet?

}

// MARK: Generated accessors for users
extension ArticleEntity {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: UserEntity)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: UserEntity)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}

// MARK: Generated accessors for medias
extension ArticleEntity {

    @objc(addMediasObject:)
    @NSManaged public func addToMedias(_ value: MediaEntity)

    @objc(removeMediasObject:)
    @NSManaged public func removeFromMedias(_ value: MediaEntity)

    @objc(addMedias:)
    @NSManaged public func addToMedias(_ values: NSSet)

    @objc(removeMedias:)
    @NSManaged public func removeFromMedias(_ values: NSSet)

}
