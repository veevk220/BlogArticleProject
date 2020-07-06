//
//  MediaEntity+CoreDataClass.swift
//  BlogArticles
//
//  Created by Vivek on 04/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//
//

import Foundation
import CoreData


public class MediaEntity: NSManagedObject {
    
    func convertToStruct() -> Media {
        var media = Media()
        media.id = self.id
        media.blogId = self.blogId
        media.createdAt = self.createdAt
        media.image = self.image
        media.title = self.title
        media.url = self.url
        return media
    }
}
