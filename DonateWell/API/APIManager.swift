//
//  APICall.swift
//  DonateWell
//
//  Created by Camilla B on 7/29/22.
//

import Foundation
import SwiftUI

//error handling
//
// create Decodable class
// // https://stackoverflow.com/questions/53569247/how-to-use-decodable-in-swift
//class APICall {
// method to get URL, parse data with async
//

class APIManager: ObservableObject {
//    
//    init() {
//        getMarket()
//    }
    
    func getMarket() {
        let url = URL(string: "https://www.predictit.org/api/marketdata/markets/7017")!

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
            print(values)


        }
        task.resume()
    }
}
