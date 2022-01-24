//
//  Offers.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import Foundation

// MARK: - Offers

struct Offers: Codable {
    var status: Int?
    var message: String?
    var promotedOffers: [PromotedOffer]?
    var countries: CountryOffer?
    var popularCountryList: [PopularCountryList]?
    var chatbotLink: String?

    enum CodingKeys: String, CodingKey {
        case countries = "data"
        case status, message, promotedOffers, popularCountryList
        case chatbotLink = "chatbot_link"
    }
}

