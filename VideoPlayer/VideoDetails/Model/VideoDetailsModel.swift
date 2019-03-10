//
//  VideoDetailsModel.swift
//  VideoPlayer
//
//  Created by TECHIES on 3/10/19.
//  Copyright © 2019 TECHIES. All rights reserved.
//

import Foundation

class VideoDetailsModel : NSObject, NSCoding{
    
    var duration : String!
    var imageUrl : String!
    var link : String!
    var name : String!
    var number : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        duration = dictionary["duration"] as? String
        imageUrl = dictionary["imageUrl"] as? String
        link = dictionary["link"] as? String
        name = dictionary["name"] as? String
        number = dictionary["number"] as? Int
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if duration != nil{
            dictionary["duration"] = duration
        }
        if imageUrl != nil{
            dictionary["imageUrl"] = imageUrl
        }
        if link != nil{
            dictionary["link"] = link
        }
        if name != nil{
            dictionary["name"] = name
        }
        if number != nil{
            dictionary["number"] = number
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        duration = aDecoder.decodeObject(forKey: "duration") as? String
        imageUrl = aDecoder.decodeObject(forKey: "imageUrl") as? String
        link = aDecoder.decodeObject(forKey: "link") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        number = aDecoder.decodeObject(forKey: "number") as? Int
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if duration != nil{
            aCoder.encode(duration, forKey: "duration")
        }
        if imageUrl != nil{
            aCoder.encode(imageUrl, forKey: "imageUrl")
        }
        if link != nil{
            aCoder.encode(link, forKey: "link")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if number != nil{
            aCoder.encode(number, forKey: "number")
        }
    }
}
