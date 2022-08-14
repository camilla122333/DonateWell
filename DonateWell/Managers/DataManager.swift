//
//  DataManager.swift
//  DonateWell
//
//  Created by Camilla B on 8/3/22.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var races: [Senate_Race] = []
    
    // starts DataManager
    init() {
        fetchRaces()
//            guard let url = URL(string: "https://www.predictit.org/api/marketdata/markets/7112") else {
//                print("Invalid URL")
//                return
//            }
//            let request = URLRequest(url: url)

//            URLSession.shared.dataTask(with: request) { data, response, error in
////                let data = data
//                let string = String(data: data!, encoding: .utf8)
//                print(string)
//                print(response)
//                print(error)
//            }.resume()
    }
    
    func fetchRaces() {
        races.removeAll()
        // ref to the db
        let db = Firestore.firestore()
        // ref to the collection
        let ref = db.collection("senate-races")
        
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    print(data)
                    // document.documentID
                    
                    // default value of empty string
                    // can change to diff pre-populated value
                    let marketId = data["id"] as? String ?? ""   // change to ID! State unique ID NOT MARKETID!
//                    let state = data["state"] as? String ?? ""
                    let state = document.documentID // "Alabama"
                    let candidate_d = data["candidate-d"] as? String ?? ""
                    let candidate_r = data["candidate-r"] as? String ?? ""
                    let market = data["market-id"] as? String ?? ""
                    let link = data["actblue-id"] as? String ?? ""
                    let isRecommended = data["isRecommended"] as? Bool ?? false

                    let senate_race = Senate_Race(id: Int(marketId)!, state: state, candidate_d: candidate_d, candidate_r: candidate_r, market: market, link: link, isRecommended: isRecommended)
                    
                    self.races.append(senate_race)
                    
                }
            }
        }
    }
    
    
   
}
