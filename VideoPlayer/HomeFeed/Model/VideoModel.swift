//
//  VideoModel.swift
//  VideoPlayer
//
//  Created by TECHIES on 3/10/19.
//  Copyright © 2019 TECHIES. All rights reserved.
//

import Foundation

class Video : NSObject, NSCoding{
    
    var channel : Channel!
    var id : Int!
    var imageUrl : String!
    var link : String!
    var name : String!
    var numberOfViews : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        id = dictionary["id"] as? Int
        imageUrl = dictionary["imageUrl"] as? String
        link = dictionary["link"] as? String
        name = dictionary["name"] as? String
        numberOfViews = dictionary["numberOfViews"] as? Int
        if let channelData = dictionary["channel"] as? [String:Any]{
            channel = Channel(fromDictionary: channelData)
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil{
            dictionary["id"] = id
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
        if numberOfViews != nil{
            dictionary["numberOfViews"] = numberOfViews
        }
        if channel != nil{
            dictionary["channel"] = channel.toDictionary()
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        channel = aDecoder.decodeObject(forKey: "channel") as? Channel
        id = aDecoder.decodeObject(forKey: "id") as? Int
        imageUrl = aDecoder.decodeObject(forKey: "imageUrl") as? String
        link = aDecoder.decodeObject(forKey: "link") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        numberOfViews = aDecoder.decodeObject(forKey: "numberOfViews") as? Int
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if channel != nil{
            aCoder.encode(channel, forKey: "channel")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
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
        if numberOfViews != nil{
            aCoder.encode(numberOfViews, forKey: "numberOfViews")
        }
    }
}
