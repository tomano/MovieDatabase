//
//  Movie.swift
//  MovieDatabase
//
//  Created by Gil Nakache on 09/10/2019.
//  Copyright © 2019 Gil Nakache. All rights reserved.
//

import Foundation

struct Movie {
    var title: String
    var overview: String
    var posterPath: String?
    var backdropPath: String?
    var releaseDate: Date?
    var voteAverage: Double
    var idMovie : Int
    var idActeur: Int
}

struct MovieResponse {
    var results: [Movie]
}

extension MovieResponse: Codable {}
extension Movie: Codable {}
