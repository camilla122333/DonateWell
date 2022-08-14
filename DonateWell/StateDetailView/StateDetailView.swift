//
//  StateDetailView.swift
//  DonateWell
//
//  Created by Camilla B on 8/5/22.
//

import SwiftUI

struct StateDetailView: View {
    
    @StateObject var apiManager = APIManager()
    @State private var showButtonRecommend: Bool = false
    @State private var showButtonPass: Bool = false
    @State var percentage2: Int = 0
    
    let state_race: Senate_Race

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
            HStack {
                Text("D Candidate: \(state_race.candidate_d)")
                    .foregroundColor(.black)
//                if let unwrapped = apiManager.response {
//                    let filteredContracts = unwrapped.contracts.filter{$0.party == "Democratic"}
//                    let percentage = Int(filteredContracts[0].lastTradePrice * 100)
//                    if percentage < 70 && percentage > 35 {
//                        let _ = showButtonRecommend = true
//                    }
//                    Text(String(percentage) + "%")
//                        .foregroundColor(.red)
//                }
                Text(String(percentage2) + "%")
                    .foregroundColor(.red)
            }
            HStack {
                Text("R Candidate: \(state_race.candidate_r)")
                    .foregroundColor(.black)
                if let unwrapped = apiManager.response {
                    let filteredContracts = unwrapped.contracts.filter{$0.party == "Republican"}
                    Text(String(Int(filteredContracts[0].lastTradePrice * 100)) + "%")
                        .foregroundColor(.red)
                }
            }
            Text("MARKET ID: \(state_race.market)")
            
//            if showButtonRecommend {
//                Rectangle("RECOMMEND") {
//                    
//                }
//            }
            
            
            if showButtonRecommend {
                NavigationLink(destination: DonationLinkView()) {
                    VStack{
                        Text("RECOMMEND")
                        Link(destination: URL(string: state_race.link)!) {
                            VStack {
                                Image("donkey")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                Text("Let's donate!")
        //                        Text(state_race.link)
                            }
                        }
                    }
                }
                .buttonStyle(.bordered)
                .foregroundColor(.white)
                .background(Color.orange)
            } else if showButtonPass {
                NavigationLink(destination: RecommendationView()) {
                    VStack {
                        Text("PASS")
                        Text("DONATE HERE INSTEAD")
                    }
                }
                .buttonStyle(.bordered)
            }
        }
        .onAppear() {
            Task {
                do {
                    try await apiManager.getMarket(market: state_race.market)
                    if let unwrapped = apiManager.response {
                        let filteredContracts = unwrapped.contracts.filter{$0.party == "Democratic"}
                        percentage2 = Int(filteredContracts[0].lastTradePrice * 100)
                        if percentage2 < 75 && percentage2 > 35 {
                            showButtonRecommend = true
                        } else {
                            showButtonPass = true
                        }
                    }
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

//struct StateDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        StateDetailView(state_race: Senate_Race(id: 0, state: "Ohio", candidate_d: "Tim Ryan (D)", candidate_r: "Lame-o (R)", market: "7012"))
//    }
//}
