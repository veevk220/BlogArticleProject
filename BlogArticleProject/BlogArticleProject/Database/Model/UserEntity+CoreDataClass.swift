//
//  UserEntity+CoreDataClass.swift
//  BlogArticles
//
//  Created by Vivek on 04/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//
//

import Foundation
import CoreData


public class UserEntity: NSManagedObject {

    public func convertToStruct() -> User {
        var user = User()
        
        user.about = self.about
        user.avatar = self.avatar
        user.blogId = self.blogId
        user.city = self.city
        user.createdAt = self.createdAt
        user.designation = self.designation
        user.id = self.id
        user.lastname = self.lastname
        user.name = self.name
        
        return user
    }
    
}
