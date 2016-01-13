//
//  Mixtape.swift
//  White Label for Swift
//
//  Created by Alexander Givens on 10/10/15.
//  Copyright © 2015 Noon Pacific LLC. All rights reserved.
//

import SwiftyJSON

public class Mixtape: Equatable {
    
    var coverLarge : String!
    var name : String!
    var id : Int!
    var coverArtistName : String!
    var coverArtistURL : String!
    var sponsorDescription : String!
    var sponsorURL : String!
    var releaseDate : String!
    var playlistNumber : Int!
    var trackCount : Int!
    var tracks = [Track]()
    
    init(fromJson json: JSON!){
        if json == nil { return }
        
        coverLarge = json["cover_large"].stringValue
        name = json["name"].stringValue
        id = json["id"].intValue
        coverArtistName = json["cover_description"].stringValue
        coverArtistURL = json["cover_url"].stringValue
        sponsorDescription = json["sponsor_description"].stringValue
        sponsorURL = json["sponsor_description"].stringValue
        releaseDate = json["release_date"].stringValue
        playlistNumber = json["playlist_number"].intValue
        trackCount = json["track_count"].intValue
    }
}

public func ==(lhs: Mixtape, rhs: Mixtape) -> Bool {
    return lhs.id == rhs.id
}
