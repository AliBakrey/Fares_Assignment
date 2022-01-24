//
//  Price.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import Foundation

// MARK: - Price

struct Price: Codable {
    var id, residencyTypeID: Int?
    var residencyType: String?
    var residencyTypeName: String?
    var roomType: String?
    var price, limit, childrenLimit: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case residencyTypeID = "residencyTypeId"
        case residencyType, residencyTypeName, roomType, price, limit
        case childrenLimit = "children_limit"
    }
}
