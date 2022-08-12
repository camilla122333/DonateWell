//
//  APICall.swift
//  DonateWell
//
//  Created by Camilla B on 7/29/22.
//

import Foundation

@MainActor
class APIManager: ObservableObject {
    @Published var response: Response?
//    @Published var d_market: 
    var market = ""
    
    func getMarket(market: String) async throws {
        guard let url = URL(string: "https://www.predictit.org/api/marketdata/markets/\(market)")
        else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            fatalError("Error while fetching data")
            
        }
        
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(
            Response.self,
            from: data
        )
        
        print(decodedData.shortName)
//        print(decodedData.contracts[0])
        
//        return decodedData
        self.response = decodedData
    }
}

