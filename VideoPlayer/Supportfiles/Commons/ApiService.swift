//
//  ApiService.swift
//  VideoPlayer
//
//  Created by TECHIES on 3/10/19.
//  Copyright © 2019 TECHIES. All rights reserved.
//

import Foundation
import Alamofire

class ApiService {
    typealias CompletionHandler = (_ result: Bool, _ data: NSArray, _ error: Error?) -> Void
    
    let baseUrl = "https://api.letsbuildthatapp.com/youtube/"
    
    func homeFeedUrl() -> String{
        return baseUrl + "home_feed"
    }
    
    func videoDetailsUrl() -> String{
        return baseUrl + "course_detail?id="
    }
    
    func userFetchHomeFeedData( handler : @escaping CompletionHandler){
        Alamofire.request(homeFeedUrl(), method: .get , parameters: nil, headers : nil).responseJSON{
            response in
            var videoArray : NSArray = []
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                videoArray = jsonData.value(forKey: "videos") as! NSArray
                handler(true,videoArray, nil)
            }else{
                handler(false, videoArray, nil)
            }
        }
    }
    
    func userFetchVideoDetail(videoId: String, handler : @escaping CompletionHandler){
        Alamofire.request(videoDetailsUrl() + videoId, method: .get , parameters: nil, headers : nil).responseJSON{
            response in
            var videoDetailsArray : NSArray = []
            if let result = response.result.value {
                videoDetailsArray = result as! NSArray
                handler(true,videoDetailsArray, nil)
            }else{
                handler(false, videoDetailsArray, nil)
            }
        }
    }
    
}
