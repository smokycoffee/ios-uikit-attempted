//
//  MovieDetailsModel.swift
//  movie-app-test
//
//  Created by Tsenguun on 1/3/23.
//

import Foundation

struct MovieeDetailsModel: Codable, Hashable {
    let id: Int?
    let url: String?
    let name, type, language: String?
    let genres: [String]?
    let status: String?
    let runtime, averageRuntime: Int?
    let premiered, ended: String?
    let officialSite: String?
    let schedule: Schedule?
    let rating: Rating?
    let weight: Int?
    let network: Network?
//    let webChannel, dvdCountry?
    let externals: Externals?
    let image: Image
    let summary: String?
    let updated: Int?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case id, url, name, type, language, genres, status, runtime, averageRuntime, premiered, ended, officialSite, schedule, rating, weight, network, externals, image, summary, updated
        case links = "_links"
    }
}

// MARK: - Externals
struct Externals: Codable, Hashable {
    let tvrage, thetvdb: Int
    let imdb: String
}

// MARK: - Image
struct Image: Codable, Hashable {
    let medium, original: String
}

// MARK: - Links
struct Links: Codable , Hashable{
    let linksSelf, previousepisode: Previousepisode

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case previousepisode
    }
}

// MARK: - Previousepisode
struct Previousepisode: Codable , Hashable{
    let href: String
}

// MARK: - Network
struct Network: Codable, Hashable {
    let id: Int
    let name: String
    let country: Country
    let officialSite: String
}

// MARK: - Country
struct Country: Codable , Hashable{
    let name, code, timezone: String
}

// MARK: - Rating
struct Rating: Codable , Hashable{
    let average: Double
}

// MARK: - Schedule
struct Schedule: Codable , Hashable{
    let time: String
    let days: [String]
}
