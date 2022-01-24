//
//  AdditionalService.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import Foundation

// MARK: - AdditionalService

struct AdditionalService: Codable {
    var additionalServiceID: Int?
    var additionalServiceName: String?
    var additionalServicePrice: Int?
    var additionalServiceNameEn, additionalServiceNameAr: String?

    enum CodingKeys: String, CodingKey {
        case additionalServiceID = "additionalServiceId"
        case additionalServiceName, additionalServicePrice, additionalServiceNameEn, additionalServiceNameAr
    }
}
