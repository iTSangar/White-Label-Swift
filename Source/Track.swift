//
//  Track.swift
//  White Label for Swift
//
//  Created by Alexander Givens on 10/13/15.
//  Copyright © 2015 Noon Pacific LLC. All rights reserved.
//

import SwiftyJSON

public class Track: Equatable {
    
    public var artistName : String!
    public var title : String!
    public var id : Int!
    public var soundCloudID : Int!
    public var soundCloudStreamURL : String!
    public var soundCloudPermalink : String!
    public var sourceNotFound : Bool!
    public var trackID : Int!
    public var number : Int!
    
    public init(fromJson json: JSON!, withSoundCloudToken soundCloudToken: String!){
        if json == nil {return }
        
        artistName = json["artist_description"].stringValue
        title = json["title"].stringValue
        id = json["id"].intValue
        soundCloudID = json["soundcloud_id"].intValue
        soundCloudStreamURL = json["soundcloud_stream_url"].stringValue + "?client_id=" + soundCloudToken
        soundCloudPermalink = json["soundcloud_permalink_url"].stringValue
        sourceNotFound = json["source_not_found"].boolValue
        trackID = json["track_id"].intValue
        number = json["track_number"].intValue
    }
}

public func ==(lhs: Track, rhs: Track) -> Bool {
    return lhs.id == rhs.id
}