//
//  IntExtension.swift
//  BlogArticles
//
//  Created by Vivek on 05/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//

import UIKit

extension Int {
    
    func convertToProperCount() -> String {
        let countInString = Double(self)
        
        if countInString > 1000 {
            let countInProperFormate = countInString / 1000
            return String(countInProperFormate) + "k"
        }
        return "\(self)"
    }
}
