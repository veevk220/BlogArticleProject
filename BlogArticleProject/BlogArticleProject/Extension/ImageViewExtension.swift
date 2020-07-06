//
//  ImageViewExtension.swift
//  BlogArticles
//
//  Created by Vivek on 03/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImageByURL(urlString: String?, placeholderImage: UIImage?) {
        
        if placeholderImage != nil {
            self.image = placeholderImage
        }
        
        guard let urlsString = urlString else { return }
        ServiceHelper.sharedInstance.callAPI(urlString: urlsString) { (data, result) in
            guard let data = data else { return }
            self.image = UIImage(data: data)
        }
    }
}
