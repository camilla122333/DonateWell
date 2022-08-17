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
    @State var percentageR: Int = 0
    
    let state_race: Senate_Race

    var body: some View {
        VStack (spacing: 18){
            Text(state_race.state)
                .textCase(.uppercase)
//                .font(.custom("NanumPen", size: 50))
                .font(Font.custom("NanumPen", size: 48))
                .scaledToFit()
                .foregroundColor(.red)
            
            HStack (spacing: 10) {
                AsyncImage(url: URL(string: state_race.candidate_d_pic)) { returnedImage in
                    returnedImage
                        .resizable()
                } placeholder: {
                    ProgressView ()
                        .progressViewStyle(.circular)
                        .tint(.blue)
                }
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .scaledToFit()
                .shadow(color: Color(hue: 0.554, saturation: 0.065, brightness: 0.775), radius: 5, x: 0, y: 10.0)
//                .background(Color.green)
                .frame(width: 120, height: 120) //  alignment
                
                Text(state_race.candidate_d)
                    .foregroundColor(.black)
//                    .background(Color.green)
                
                if state_race.market != "" {
                        Text(String(percentage2) + "%")
                        .frame(width: 55, height: 55)
                        .foregroundColor(.red)
                        .background (
                            Circle()
                                .fill(.white)
                                .shadow(color: Color(hue: 0.554, saturation: 0.065, brightness: 0.775), radius: 5, x: 0, y: 10.0)
                        )
//                    .background(Color.green)
                }
            }
            .padding()
//            .padding(.horizontal)
            .border(Color.gray, width: 1)
            .background(Color("libertyColor"))
            .shadow(color: Color(hue: 0.554, saturation: 0.065, brightness: 0.775), radius: 5, x: 0, y: 10.0)
            
            HStack (spacing: 15) {
                AsyncImage(url: URL(string: state_race.candidate_r_pic)) { returnedImage in
                    returnedImage
                        .resizable()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(.red)
                }
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .scaledToFit()
                .shadow(color: Color(hue: 0.554, saturation: 0.076, brightness: 0.908, opacity: 0.694), radius: 2, x: 0, y: 10.0)
                .frame(width: 120, height: 120) //  alignment
                
                Text(state_race.candidate_r)
                    .foregroundColor(.black)
                    
                if state_race.market != "" {
                        Text(String(percentageR) + "%")
                        .frame(width: 55, height: 55)
                        .foregroundColor(.red)
                        .background (
                            Circle()
                                .fill(Color.white)
                                .shadow(color: Color(hue: 0.554, saturation: 0.065, brightness: 0.775), radius: 5, x: 0, y: 10.0)
                        )
                }
            }
            .padding()
            .padding(.horizontal)
            .border(Color.gray, width: 1)
            .background(Color(red: 0.9725490196078431, green: 0.9411764705882353, blue: 0.8745098039215686))
            .shadow(color: Color(hue: 0.554, saturation: 0.065, brightness: 0.775), radius: 5, x: 0, y: 10.0)
            
            if showButtonRecommend {
//                NavigationLink(destination: DonationLinkView()) {
                    VStack{
                        Text("RECOMMEND")
                        Link(destination: URL(string: state_race.link)!) {
                            VStack {
                                Image("donkey")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                Text("Let's donate!")
                            }
                        }
                    }
//                }
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
                    if state_race.market != "" {
                        try await apiManager.getMarket(market: state_race.market)
                        if let unwrapped = apiManager.response {
                            let filteredContracts = unwrapped.contracts.filter{$0.party == "Democratic"}
                            let filteredContractsRep = unwrapped.contracts.filter{$0.party == "Republican"}
                            percentageR = Int(filteredContractsRep[0].lastTradePrice * 100)
                            percentage2 = Int(filteredContracts[0].lastTradePrice * 100)
                            if percentage2 < 75 && percentage2 > 35 {
                                showButtonRecommend = true
                            } else {
                                showButtonPass = true
                            }
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
