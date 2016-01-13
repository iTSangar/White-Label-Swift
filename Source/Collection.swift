//
//  Collection.swift
//  White Label for Swift
//
//  Created by Alexander Givens on 1/13/16.
//  Copyright © 2016 Noon Pacific LLC. All rights reserved.
//

public class Collection {
    
    public var name : String!
    public var id : Int!
    public var mixtapes: [Mixtape]? = nil
    
}

public func ==(lhs: Collection, rhs: Collection) -> Bool {
    return lhs.id == rhs.id
}