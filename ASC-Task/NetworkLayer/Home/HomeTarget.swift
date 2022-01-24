//
//  HomeTarget.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import NetworkLayerSwift

enum HomeTarget: TargetType {
    case getOffers
}

extension HomeTarget {
    var baseURL: URL { URL(string: Server.baseUrl)! }

    var path: String {
        switch self {
        case .getOffers:
            return EndPoint.offers
        }
    }

    var method: NetworkLayerSwift.Method {
        switch self {
        case .getOffers:
            return .get
        }
    }

    var sampleData: Data { Data() }

    var task: Task {
        switch self {
        case .getOffers:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return nil
    }
}
