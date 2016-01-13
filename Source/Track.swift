//
//  Track.swift
//  White Label for Swift
//
//  Created by Alexander Givens on 10/13/15.
//  Copyright © 2015 Noon Pacific LLC. All rights reserved.
//

import SwiftyJSON

class Track: Equatable {
    
    var artistName : String!
    var title : String!
    var id : Int!
    var soundCloudID : Int!
    var soundCloudStreamURL : String!
    var soundCloudPermalink : String!
    var sourceNotFound : Bool!
    var trackID : Int!
    var number : Int!
    
    init(fromJson json: JSON!, withSoundCloudToken soundCloudToken: String!){
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

func ==(lhs: Track, rhs: Track) -> Bool {
    return lhs.id == rhs.id
}