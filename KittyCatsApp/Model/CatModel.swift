//
//  CatModel.swift
//  KittyCatsApp
//
//  Created by Sabina Huseynova on 26.10.21.
//

import Foundation

struct CatModel: Decodable {
    var breeds: [CatBreeds]?
    var id, url: String?
    var width, height: Int?
    
    enum CodingKeys: String, CodingKey {
        case breeds = "breeds"
        case id = "id"
        case width = "width"
        case height = "height"
        case url = "url"
    }
}

struct CatBreeds: Decodable {
    var weight: [String: String]?
    var id, name, cfaUrl, vetstreetUrl, temperament, origin, countryCodes, countryCode, description, lifespan,altNames, wikipediaUrl, referenceImageId: String?
    var indoor, adaptability, affectionLevel, childFriendly, dogFriendly, energyLevel, grooming, healthIssues, intelligence, sheddingLevel, socialNeeds, strangerFriendl, vocalisation, experimental, hairless, natural, rare, rex, suppressedTail, shortLegs, hypoallergenic: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case weight = "weight"
        case id = "id"
        case name = "name"
        case cfaUrl = "cfa_url"
        case vetstreetUrl = "vetstreet_url"
        case temperament = "temperament"
        case origin = "origin"
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case description = "description"
        case lifespan = "life_span"
        case indoor = "indoor"
        case altNames = "alt_names"
        case adaptability = "adaptability"
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming = "grooming"
        case healthIssues = "health_issues"
        case intelligence = "intelligence"
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendl = "stranger_friendl"
        case vocalisation = "vocalisation"
        case experimental = "experimental"
        case hairless = "hairless"
        case natural = "natural"
        case rare = "rare"
        case rex = "rex"
        case suppressedTail = "suppressed_tail"
        case shortLegs = "short_legs"
        case wikipediaUrl = "wikipedia_url"
        case hypoallergenic = "hypoallergenic"
        case referenceImageId = "reference_image_id"
    }
}
