//
//  Country.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import Foundation

// MARK: - CountryOffer

struct CountryOffer: Codable {
    var offersAfrica: [PromotedOffer]?
    var offersAsia, offersAustralia, offersEurope, offersNAmerica: [PromotedOffer]?
    var offersSAmerica: [PromotedOffer]?

    func getOfferSection() -> [CountryOfferSection] {
        var offerSection = [CountryOfferSection]()
        if offersAfrica?.isEmpty == false {
            offerSection.append(CountryOfferSection(name: "Africa", offers: offersAfrica))
        }
        if offersAsia?.isEmpty == false {
            offerSection.append(CountryOfferSection(name: "Asia", offers: offersAsia))
        }
        if offersAustralia?.isEmpty == false {
            offerSection.append(CountryOfferSection(name: "Australia", offers: offersAustralia))
        }
        if offersEurope?.isEmpty == false {
            offerSection.append(CountryOfferSection(name: "Europe", offers: offersEurope))
        }
        if offersNAmerica?.isEmpty == false {
            offerSection.append(CountryOfferSection(name: "North America", offers: offersNAmerica))
        }
        if offersSAmerica?.isEmpty == false {
            offerSection.append(CountryOfferSection(name: "South America", offers: offersSAmerica))
        }
        return offerSection
    }
}

struct CountryOfferSection {
    var name: String?
    var offers: [PromotedOffer]?
}
