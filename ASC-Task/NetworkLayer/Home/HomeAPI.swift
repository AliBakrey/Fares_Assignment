//
//  HomeAPI.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import NetworkLayerSwift

protocol HomeAPIProtocol {
    @discardableResult
    func getOffers(completion: @escaping NLCompletionMappable<Offers>) -> CancellableRequest?
}

class HomeAPI: HomeAPIProtocol {
    @discardableResult
    func getOffers(completion: @escaping NLCompletionMappable<Offers>) -> CancellableRequest? {
        NL.fetchData(target: HomeTarget.getOffers,
                     responseClass: Offers.self,
                     errorClass: Offers.self,
                     completion: completion)
    }
}
