//
//  HomeViewModel.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import Combine
import Foundation

enum HomeOffer {
    case promotedOffers(_ offers: [PromotedOffer]?)
    case countries(_ countries: [PopularCountryList]?)
    case countryOffer(_ offers: [CountryOfferSection]?)
}

protocol HomeViewModelProtocol: AnyObject {
    var offers: Published<[HomeOffer]>.Publisher { get }

    func getOffers()
}

class HomeViewModel: HomeViewModelProtocol {
    @Published private(set) var offersValue: [HomeOffer] = []
    var offers: Published<[HomeOffer]>.Publisher { $offersValue }

    let homeProvider: HomeProviderProtocol

    init(homeProvider: HomeProviderProtocol = HomeProvider()) {
        self.homeProvider = homeProvider
    }

    func getOffers() {
        homeProvider.getOffers { [weak self] result in
            switch result {
            case let .success(offers):
                var homeOffers = [HomeOffer]()
                if let promotedOffers = offers?.promotedOffers {
                    homeOffers.append(HomeOffer.promotedOffers(promotedOffers))
                }
                if let popularCountryList = offers?.popularCountryList {
                    homeOffers.append(HomeOffer.countries(popularCountryList))
                }
                if let offerSection = offers?.countries?.getOfferSection() {
                    homeOffers.append(HomeOffer.countryOffer(offerSection))
                }
                self?.offersValue = homeOffers
            case let .failure(error):
                print(error)
            }
        }
    }
}
