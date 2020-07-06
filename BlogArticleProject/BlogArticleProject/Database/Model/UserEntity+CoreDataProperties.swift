//
//  UserEntity+CoreDataProperties.swift
//  BlogArticles
//
//  Created by Vivek on 04/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var about: String?
    @NSManaged public var avatar: String?
    @NSManaged public var blogId: String?
    @NSManaged public var city: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var designation: String?
    @NSManaged public var id: String?
    @NSManaged public var lastname: String?
    @NSManaged public var name: String?
    @NSManaged public var relatedArticle: ArticleEntity?

}
