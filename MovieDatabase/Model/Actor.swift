//
//  Actor.swift
//  MovieDatabase
//
//  Created by Thomas Manaut on 27/11/2019.
//  Copyright © 2019 Gil Nakache. All rights reserved.
//

import Foundation


struct Actor {
    var name : String
    var character: String
    var profilePath: String?
}


struct ActorResponse{
    var cast: [Actor]
}

extension ActorResponse: Codable{}
extension Actor : Codable{}

