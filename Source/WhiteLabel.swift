//
//  WhiteLabel.swift
//  White Label for Swift
//
//  Created by Alexander Givens on 12/14/15.
//  Copyright © 2015 Noon Pacific LLC. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WhiteLabel {
    
    static let baseURL: String = "https://api.colormyx.com/v1/"
    static var appSlug: String!
    static var soundCloudToken: String!
    static var collection = Collection()
    
    class func getMixtapes(completionHandler: ([Mixtape]?, NSError?) -> Void) {
        let urlString = baseURL + appSlug + "/playlists/"
        self.debugPrint("Begin request for \(urlString).")
        
        Alamofire.request(.GET, urlString).validate().responseJSON { response in
            switch response.result {
            case .Success:
                
                if let value = response.result.value {
                    let json = JSON(value)
                    self.debugPrint("Recieved JSON for \(urlString):\n\(json)")
                    
                    if let mixtapes = self.createMixtapesFromJSON(json) {
                        completionHandler(mixtapes, nil)
                    } else {
                        // TODO: return custom NSError, unable to create Mixtapes from JSON
                        completionHandler(nil, nil)
                    }
                } else {
                    // TODO: return custom NSError
                    completionHandler(nil, nil)
                }
                
            case .Failure(let error):
                
                self.debugPrint("Return error for \(urlString):\n\(error)")
                completionHandler(nil, error)
                
            }
        }
    }
    
    class func getTracksforMixtape(mixtape: Mixtape, completionHandler: ([Track]?, NSError?) -> Void) {
        let mixtapeId = String(mixtape.id)
        let urlString = baseURL + appSlug + "/playlists/" + mixtapeId + "/tracks/?detail=true"
        self.debugPrint("Begin request for \(urlString).")
        
        Alamofire.request(.GET, urlString).validate().responseJSON { response in
            switch response.result {
            case .Success:
                
                if let value = response.result.value {
                    let json = JSON(value)
                    self.debugPrint("Recieved JSON for \(urlString):\n\(json)")
                    
                    if let tracks = self.createTracksFromJSON(json, forMixtape: mixtape) {
                        completionHandler(tracks, nil)
                    } else {
                        // TODO: return custom NSError, unable to create Tracks from JSON
                        completionHandler(nil, nil)
                    }
                } else {
                    // TODO: return custom NSError
                    completionHandler(nil, nil)
                }
                
            case .Failure(let error):
                
                self.debugPrint("Return error for \(urlString):\n\(error)")
                completionHandler(nil, error)
                
            }
        }
    }
    
    class func postListenEventForMixtape(mixtape: Mixtape, track: Track, completionHandler: ((NSError?) -> Void)?) {
        let urlString = baseURL + "events/listen/"
        let parameters = [
            "playlist": String(mixtape.id),
            "track": String(track.id)
        ]
        self.debugPrint("Begin request for \(urlString).")
        
        Alamofire.request(.POST, urlString, parameters: parameters).response { request, response, data, error in
            #if DEBUG
                if let value = response.result.value {
                    let json = JSON(value)
                    print("Recieved JSON for \(urlString):\n\(json)")
                } else {
                    print("Error for \(urlString):\n\(error)")
                }
            #endif
            if completionHandler != nil {
                completionHandler!(error)
            }
        }
    }
    
    class private func createMixtapesFromJSON(json: JSON) -> [Mixtape]? {
        if json == nil || json.count == 0 {
            return nil
        }
        
        let mixtapesJSON = json.arrayValue
        var mixtapes = [Mixtape]()
        
        for mixtapeJSON in mixtapesJSON{
            let mixtape = Mixtape(fromJson: mixtapeJSON)
            mixtapes.append(mixtape)
        }
        
        WhiteLabel.collection.mixtapes = mixtapes
        
        return mixtapes
    }
    
    class private func createTracksFromJSON(json: JSON, forMixtape mixtape: Mixtape) -> [Track]? {
        if json == nil || json.count == 0 {
            return nil
        }
        
        let tracksJSON = json.arrayValue
        var tracks = [Track]()
        
        for trackJSON in tracksJSON{
            let track = Track(fromJson: trackJSON, withSoundCloudToken: soundCloudToken)
            tracks.append(track)
        }
        
        mixtape.tracks = tracks
        
        return tracks
    }
    
    class private func debugPrint(string: String) {
        #if DEBUG
            print(string)
        #endif
    }
}
