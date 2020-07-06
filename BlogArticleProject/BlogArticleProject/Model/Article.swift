//
//  Article.swift
//  BlogArticles
//
//  Created by Vivek on 03/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//

import Foundation

public struct Article: Codable {
    
    // MARK: - Properties
    
    var id:String?
    var createdAt:String?
    var content:String?
    var comments:Int?
    var likes:Int?
    var user:[User]?
    var media:[Media]?
    
}

public struct User: Codable {
    
    // MARK: - Properties
    
    var id:String?
    var blogId:String?
    var createdAt:String?
    var name:String?
    var avatar:String?
    var lastname:String?
    var city:String?
    var designation:String?
    var about:String?
}


public struct Media: Codable {
    
    // MARK: - Properties
    
    var id:String?
    var blogId:String?
    var createdAt:String?
    var image:String?
    var title:String?
    var url:String?
}
