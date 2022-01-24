//
//  HomeProvider.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import Foundation

protocol HomeProviderProtocol {
    @discardableResult
    func getOffers(completion: @escaping (Result<Offers?, NSError>) -> Void) -> Cancellable?
}

class HomeProvider: HomeProviderProtocol {
    var api: HomeAPIProtocol!

    init(api: HomeAPIProtocol = HomeAPI()) {
        self.api = api
    }

    func getOffers(completion: @escaping (Result<Offers?, NSError>) -> Void) -> Cancellable? {
        return api.getOffers { result, _ in
            switch result {
            case let .success(response):
                completion(.success(response))
            case let .failure(error):
                completion(.failure(error))
            }
        }?.cancellable
    }
}
