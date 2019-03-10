//
//  RootModel.swift
//  VideoPlayer
//
//  Created by TECHIES on 3/10/19.
//  Copyright © 2019 TECHIES. All rights reserved.
//

import Foundation

class RootClass : NSObject, NSCoding{
    
    var user : User!
    var videos : [Video]!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        if let userData = dictionary["user"] as? [String:Any]{
            user = User(fromDictionary: userData)
        }
        videos = [Video]()
        if let videosArray = dictionary["videos"] as? [[String:Any]]{
            for dic in videosArray{
                let value = Video(fromDictionary: dic)
                videos.append(value)
            }
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if user != nil{
            dictionary["user"] = user.toDictionary()
        }
        if videos != nil{
            var dictionaryElements = [[String:Any]]()
            for videosElement in videos {
                dictionaryElements.append(videosElement.toDictionary())
            }
            dictionary["videos"] = dictionaryElements
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        user = aDecoder.decodeObject(forKey: "user") as? User
        videos = aDecoder.decodeObject(forKey: "videos") as? [Video]
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if user != nil{
            aCoder.encode(user, forKey: "user")
        }
        if videos != nil{
            aCoder.encode(videos, forKey: "videos")
        }
    }
}
