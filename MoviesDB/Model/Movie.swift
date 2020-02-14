//
//  Movie.swift
//  MoviesDB
//
//  Created by BumLak Kim on 2/13/20.
//  Copyright © 2020 BumLak Kim. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let posterPath: String
    let backdropPath: String
    let voteAverage: Double
    let overview: String
    let releaseDate: String
    let voteCount: Int
}
