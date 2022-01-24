//
//  PopularCountryList.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import Foundation

// MARK: - PopularCountryList

struct PopularCountryList: Codable {
    var id: Int?
    var nameAr, nameEn, currency, code: String?
    var image: String?
    var offersCount: Int?
    var offers: [PromotedOffer]?

    enum CodingKeys: String, CodingKey {
        case id
        case nameAr = "name_ar"
        case nameEn = "name_en"
        case currency, code, image
        case offersCount = "offers_count"
        case offers
    }
}
