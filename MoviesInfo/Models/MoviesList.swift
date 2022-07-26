//
//  Movie.swift
//  MoviesInfo
//
//  Created by Yassine EL HALAOUI on 20/7/2022.
//

import Foundation

// MARK: - MovieList
struct MoviesList: Codable {
    let page: Int?
    let results: [ResponseItem]?
    let totalResults, totalPages: Int?
    
    var success: Bool?
    var message: String?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

// MARK: - Movie
struct ResponseItem: Codable {
    let posterPath: String?
    let adult: Bool
    let overview, releaseDate: String
    let genreIDS: [Int]
    let id: Int
    let originalTitle: String
    let originalLanguage: OriginalLanguage
    let title: String
    let backdropPath: String?
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult, overview
        case releaseDate = "release_date"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
}
