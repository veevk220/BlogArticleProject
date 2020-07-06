//
//  ServiceHelper.swift
//  BlogArticles
//
//  Created by Vivek on 03/07/20.
//  Copyright © 2020 Vivek. All rights reserved.
//

import UIKit

class ServiceHelper: NSObject {
    
    // MARK: - API Enum
    
    enum APIURL: String {
        case articleAPI = "https://5e99a9b1bc561b0016af3540.mockapi.io/jet2/api/v1/blogs?page= 1&limit=10"
    }
    
    // MARK: - Properties
    
    static let sharedInstance = ServiceHelper()
    private let session = URLSession(configuration: URLSessionConfiguration.default)
    
    // MARK: - Initialiser
    
    private override init() {
        // Making private initialiser to make singleton
    }
    
    // MARK: - Functions
    
    func callAPI(urlString: String, completion:@escaping (Data?,Bool) -> ()) {
        
        DispatchQueue.global(qos: .background).async {
            guard let urlString  = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString) else { return }
            
            let task = self.session.dataTask(with: url) { (data, response, errorInAPI) in
                DispatchQueue.main.async {
                    if data != nil && errorInAPI == nil {
                        completion(data,true)
                    }
                    completion(nil,false)
                }
            }
            task.resume()
        }
    }
}
