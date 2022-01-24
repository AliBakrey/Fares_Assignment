//
//  PromotedOffer.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import Foundation

// MARK: - PromotedOffer

struct PromotedOffer: Codable {
    var id: Int?
    var offerDisplayID: String?
    var expired: Int?
    var status: String?
    var isPromoted: Int?
    var fullyBooked: Int?
    var expirationDate: String?
    var openPackage, multiCities: Int?
    var title: String?
    var currency: String?
    var promotedOfferDescription: String?
    var policy: String?
    var image: String?
    var favouriteCount, bookingsCount: Int?
    var bookingsLimitation: Int?
    var dateFrom, dateTo: String?
    var durationDigits: Int?
    var duration: String?
    var acceptCivilID, isFavorited: Int?
    var dateFromFormated, dateToFormated: String?
    var images: [String]?
    var destination: String?
    var includedServices: String?
    var price: Int?
    var prices: [Price]?
    var residencyTypesIDs: [Int]?
    var additionalServices: [AdditionalService]?
    var residencyName: String?
    var type: String?
    var baseAdult, baseChild: String?

    enum CodingKeys: String, CodingKey {
        case id
        case offerDisplayID = "offer_display_id"
        case expired, status, isPromoted
        case fullyBooked = "fully_booked"
        case expirationDate, openPackage, multiCities, title
        case currency
        case promotedOfferDescription = "description"
        case policy, image, favouriteCount, bookingsCount, bookingsLimitation, dateFrom, dateTo, durationDigits, duration
        case acceptCivilID = "acceptCivilId"
        case isFavorited, dateFromFormated, dateToFormated, images, destination, includedServices, price, prices, residencyTypesIDs, additionalServices, residencyName, type
        case baseAdult = "base_adult"
        case baseChild = "base_child"
    }
}
