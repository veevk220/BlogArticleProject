//
//  StringExtension.swift
//  BlogArticles
//
//  Created by Vivek on 05/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//

import UIKit

extension String {
    
    func toDate()-> String {
        
        let currentDateFormat = DateFormatter()
        currentDateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = currentDateFormat.date(from: self) {
            let expectedDateFormat = DateFormatter()
            expectedDateFormat.dateFormat = "dd-MMM-yyyy"
            
            return expectedDateFormat.string(from: date)
        }
        return ""
    }
}
