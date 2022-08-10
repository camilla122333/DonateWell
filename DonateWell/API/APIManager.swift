//
//  APICall.swift
//  DonateWell
//
//  Created by Camilla B on 7/29/22.
//

import Foundation
import SwiftUI

class APIManager: ObservableObject {
//    @Published var races: [Senate_Race] = []
    var market = ""
    
//    init() {
//        getMarket()
//    }
//
//    func getMarket(market: String) async throws -> Response? {
    func getMarket(market: String) {
        let url = URL(string: "https://www.predictit.org/api/marketdata/markets/\(market)")!

//        let task = await URLSession
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }

            guard let data = data else {
                print("Data is empty")
                return
            }

            let decoder = JSONDecoder()
            // try!
            let values = try! decoder.decode(Response.self, from: data)
            print(values.shortName)


        }
        task.resume()
//        return nil
    }
}
