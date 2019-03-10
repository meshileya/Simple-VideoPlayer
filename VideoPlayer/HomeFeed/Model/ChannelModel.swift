//
//  ChannelModel.swift
//  VideoPlayer
//
//  Created by TECHIES on 3/10/19.
//  Copyright © 2019 TECHIES. All rights reserved.
//

import Foundation

class Channel : NSObject, NSCoding{
    
    var name : String!
    var numberOfSubscribers : Int!
    var profileImageUrl : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        name = dictionary["name"] as? String
        numberOfSubscribers = dictionary["numberOfSubscribers"] as? Int
        profileImageUrl = dictionary["profileImageUrl"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if name != nil{
            dictionary["name"] = name
        }
        if numberOfSubscribers != nil{
            dictionary["numberOfSubscribers"] = numberOfSubscribers
        }
        if profileImageUrl != nil{
            dictionary["profileImageUrl"] = profileImageUrl
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        name = aDecoder.decodeObject(forKey: "name") as? String
        numberOfSubscribers = aDecoder.decodeObject(forKey: "numberOfSubscribers") as? Int
        profileImageUrl = aDecoder.decodeObject(forKey: "profileImageUrl") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if numberOfSubscribers != nil{
            aCoder.encode(numberOfSubscribers, forKey: "numberOfSubscribers")
        }
        if profileImageUrl != nil{
            aCoder.encode(profileImageUrl, forKey: "profileImageUrl")
        }
    }
}
