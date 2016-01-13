//
//  Collection.swift
//  White Label for Swift
//
//  Created by Alexander Givens on 1/13/16.
//  Copyright © 2016 Noon Pacific LLC. All rights reserved.
//

class Collection {
    
    var name : String!
    var id : Int!
    var mixtapes: [Mixtape]? = nil
    
}

func ==(lhs: Collection, rhs: Collection) -> Bool {
    return lhs.id == rhs.id
}