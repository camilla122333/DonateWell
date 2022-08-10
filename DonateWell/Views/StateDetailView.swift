//
//  StateDetailView.swift
//  DonateWell
//
//  Created by Camilla B on 8/5/22.
//

import SwiftUI

struct StateDetailView: View {
    
    @StateObject var apiManager = APIManager()
    let state_race: Senate_Race
//    make instance of Response optionally available to StateDetailView
//    @State var response: Response?

    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                    .frame(width: 400, height: 200)
                    .foregroundColor(.yellow)
                Text(state_race.state)
                    .foregroundColor(.black)
                    .font(.system(size: 60, weight: .bold))
            }
            Text("D Candidate: \(state_race.candidate_d)")
                .foregroundColor(.black)
            Text("R Candidate: \(state_race.candidate_r)")
                .foregroundColor(.black)
            Text("MARKET ID: \(state_race.market)")
//            Text(apresponse?.shortName)
            apiManager.response.map{
                Text(String($0.marketId))
            }
        }
//        .task {
//            do {
//                self.response = try await apiManager.getMarket(market: state_race.market)
//            } catch {
//                print("Error getting market: \(error)")
//            }
//        }
        .onAppear() {
            Task {
                do {
                    try await apiManager.getMarket(market: state_race.market)
//                    self.response = try await apiManager.getMarket(market: state_race.market)
                } catch {
                    print("Error getting market: \(error)")
                }
            }

        }
//        .environmentObject(apiManager)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.494, saturation: 0.138, brightness: 0.964, opacity: 0.941))
    }
}

struct StateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StateDetailView(state_race: Senate_Race(id: 0, state: "Ohio", candidate_d: "Tim Ryan (D)", candidate_r: "Lame-o (R)", market: "7012"))
    }
}

//response: Response(marketId: 1000, shortName: "Who will win", contracts: [Response.Contract(contractId: 2000, party: "Democratic", lastTradePrice: 0.56, lastClosePrice: 0.56)])
// argument for StateDetailView_Previews call
//response: Response(marketId: 1000, shortName: "Who will win", contracts: [Response.Contract(contractId: 2000, party: "Democratic", lastTradePrice: 0.56, lastClosePrice: 0.56)])


// for loop through response.contracts
    // if response.contract.party == "Democrat"
        // Text("PRICE: \(response.contract.lastTradePrice * 100)%")
//            Text(response!.shortName)

// how to coalesce?
// Text("PRICE:" + response!.shortName ?? "<randomtext>")


//         .onAppear() {
//             apiManager.getMarket(market: state_race.market)
//
//         }
