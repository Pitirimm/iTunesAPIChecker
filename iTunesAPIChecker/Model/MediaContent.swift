//
//  MediaContent.swift
//  iTunesAPIChecker
//
//  Created by Yuriy Martinovskiy on 25.06.2021.
//

struct ItunesAnswer: Decodable {
    let resultCount: Int
    let results: [MediaContent]
}

struct MediaContent: Decodable {
    let artistName: String
    let trackName: String
    let artworkUrl100: String
    let shortDescription: String?
}
