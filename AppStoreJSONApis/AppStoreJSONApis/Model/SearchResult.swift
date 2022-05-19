//
//  SearchResult.swift
//  AppStoreJSONApis
//
//  Created by Ivan Pestov on 04.04.2022.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String // app item
    var formattedPrice: String?
    let description: String
    var releaseNotes: String?
}
