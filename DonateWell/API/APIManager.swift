//
//  APICall.swift
//  DonateWell
//
//  Created by Camilla B on 7/29/22.
//

import Foundation

class APIManager: ObservableObject {
    @Published var response: Response?
    var market = ""
    
//    init() {
//        getMarket()
//    }
//
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
//        return decodedData
        self.response = decodedData
    }
}



//        let task = await URLSession.shared.dataTask(with: url) { data, response, error in
//            guard error == nil else {
//                print(error!)
//                return
//            }
//
//            guard let data = data else {
//                print("Data is empty")
//                return
//            }
//
//            let decoder = JSONDecoder()
//            // try!
//            let values = try! decoder.decode(Response.self, from: data)
//            print(values.shortName)
//
//
//        }
//        task.resume()
//        return nil
