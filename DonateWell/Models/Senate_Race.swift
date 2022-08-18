//
//  Senate_Race.swift
//  DonateWell
//
//  Created by Camilla B on 8/3/22.
//

import SwiftUI

// add Codable
struct Senate_Race: Identifiable {
    
    var id: Int
    var state: String
    var candidate_d: String
    var candidate_r: String
    var market: String
    var link: String
    var isRecommended: Bool
    var candidate_d_pic: String
    var candidate_r_pic: String
    var state_partisanship: String
    
}

