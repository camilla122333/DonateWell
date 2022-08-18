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
    @State var dChancesNoMarket: Int = 1
    @State var rChancesNoMarket: Int = 1
    
    let state_race: Senate_Race

    var body: some View {
        VStack (spacing: 18){
            Text(state_race.state)
                .textCase(.uppercase)
                .font(Font.custom("NanumPen", size: 50))
                .scaledToFit()
                .foregroundColor(.red)
            
            // D CANDIDATE
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
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
//                .background(Color.green)
                .frame(width: 120, height: 120) //  alignment
                
                Text(state_race.candidate_d)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
//                    .background(Color.green)
                
                if state_race.market != "" {
                        Text(String(percentage2) + "%")
                        .frame(width: 55, height: 55)
                        .foregroundColor(Color(hue: 0.533, saturation: 0.961, brightness: 0.933))
                        .font(Font.title3.weight(.semibold))
                        .background (
                            Circle()
                                .fill(.white)
                                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                        )
//                    .background(Color.green)
                } else if state_race.state_partisanship == "red" {
                    Text(String(dChancesNoMarket) + "%")
                    .frame(width: 55, height: 55)
                    .foregroundColor(Color(hue: 0.533, saturation: 0.961, brightness: 0.933))
                    .font(Font.title3.weight(.semibold))
                    .background (
                        Circle()
                            .fill(.white)
                            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                    )
                } else if state_race.market == "" && state_race.state_partisanship == "blue" {
                    let dPercentage = 100 - rChancesNoMarket
                    Text(String(dPercentage) + "%")
                    .frame(width: 55, height: 55)
                    .foregroundColor(Color(hue: 0.533, saturation: 0.961, brightness: 0.933))
                    .font(Font.title3.weight(.semibold))
                    .background (
                        Circle()
                            .fill(.white)
                            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                    )
                }
            }
            .padding()
//            .padding(.horizontal)
            .border(Color.gray, width: 1)
            .background(Color(red: 0.9607843137254902, green: 0.9294117647058824, blue: 0.8431372549019608))
            .shadow(color: Color(hue: 0.554, saturation: 0.065, brightness: 0.775), radius: 5, x: 0, y: 10.0)
            
            
            
            // D CANDIDATE
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
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                .frame(width: 120, height: 120) //  alignment
                
                Text(state_race.candidate_r)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    
                if state_race.market != "" {
                        Text(String(percentageR) + "%")
                        .frame(width: 55, height: 55)
                        .foregroundColor(.red)
                        .font(Font.title3.weight(.semibold))
                        .background (
                            Circle()
                                .fill(Color.white)
                                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                        )
                } else if state_race.market == "" && state_race.state_partisanship == "blue" {
                    Text(String(rChancesNoMarket) + "%")
                    .frame(width: 55, height: 55)
                    .foregroundColor(.red)
                    .font(Font.title3.weight(.semibold))
                    .background (
                        Circle()
                            .fill(.white)
                            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                    )
                } else if state_race.market == "" && state_race.state_partisanship == "red" {
                    let rPercentage = 100 - dChancesNoMarket
                    Text(String(rPercentage) + "%")
                    .frame(width: 55, height: 55)
                    .foregroundColor(.red)
                    .font(Font.title3.weight(.semibold))
                    .background (
                        Circle()
                            .fill(.white)
                            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                    )
                }
            }
            .padding()
//            .padding(.horizontal)
            .border(Color.gray, width: 1)
            .background(Color(red: 0.9607843137254902, green: 0.9294117647058824, blue: 0.8431372549019608))
            .shadow(color: Color(hue: 0.554, saturation: 0.065, brightness: 0.775), radius: 5, x: 0, y: 10.0)
            
            
            
            // RECOMMENDATION VIEW
            if state_race.market == "" {
                Text("NOT EFFECTIVE")
                .foregroundColor(.red)
                .font(Font.custom("NanumPen", size: 40))

                NavigationLink(destination: RecommendationView()) {
                    HStack {
                        Image(systemName: "star.fill")
                        VStack {
                            Text("DONATE HERE")
                            Text("INSTEAD")
                        }
                    }
                    .foregroundColor(.white)
                }
                .buttonStyle(GradientButtonStyle())
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
            }
            
            if showButtonRecommend {
                Text("EFFECTIVE DONATION")
                    .foregroundColor(.red)
                    .font(Font.custom("NanumPen", size: 40))
                
                Link(destination: URL(string: state_race.link)!) {
                    HStack {
                        Image(systemName: "heart.fill")
                        Text("LET\'S DONATE!")
                    }
                    .foregroundColor(.white)
                }
                .buttonStyle(GradientButtonStyle())
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                
                
//                    VStack{
//                        Text("RECOMMEND")
//                        Link(destination: URL(string: state_race.link)!) {
//                            VStack {
//                                Image("donkey")
//                                    .resizable()
//                                    .frame(width: 40, height: 40)
//                                Text("Let's donate!")
//                            }
//                        }
//                    }
//                    .buttonStyle(.bordered)
//                    .foregroundColor(.white)
//                    .background(Color.orange)
//
                
                
            } else if showButtonPass {
                
                Text("NOT EFFECTIVE")
                .foregroundColor(.red)
                .font(Font.custom("NanumPen", size: 40))

                NavigationLink(destination: RecommendationView()) {
                    HStack {
                        Image(systemName: "star.fill")
                        VStack {
                            Text("DONATE HERE")
                            Text("INSTEAD")
                        }
                    }
                    .foregroundColor(.white)
                }
                .buttonStyle(GradientButtonStyle())
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
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
                            if percentage2 < 77 && percentage2 > 23 {
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
