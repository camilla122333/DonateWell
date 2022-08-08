//
//  Response.swift
//  DonateWell
//
//  Created by Camilla B on 8/8/22.
//

import Foundation
import SwiftUI

struct Response: Codable, Hashable {
    var marketId: Int
    var shortName: String
    var contracts: [Contract]
    
    struct Contract: Codable, Hashable {
        var contractId: Int
        var party: String
        var lastTradePrice: Double
        var lastClosePrice: Double

        enum CodingKeys: String, CodingKey {
            case contractId = "id"
            case party = "name"
            case lastTradePrice
            case lastClosePrice
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case marketId = "id"
        case shortName
        case contracts
    }
}


