//
//  CharacterModels.swift
//  rickandmorty_characterdatabase
//
//  Created by Admin on 30/9/22.
//

import Foundation

// MARK: CHARACTER MODEL
struct CharacterModel: Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
}

// MARK: CHARACTER ORIGIN MODEL
struct Origin: Codable {
    var name: String
    var url: String
}

// MARK: CHARACTER LOCATION MODEL
struct Location: Codable {
    var name: String
    var url: String
}

// MARK: JSON FULL DATA MODEL
struct FullData: Codable {
    var results: [CharacterModel]
}
