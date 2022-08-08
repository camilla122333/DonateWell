//
//  StateDetailView.swift
//  DonateWell
//
//  Created by Camilla B on 8/5/22.
//

import SwiftUI

struct StateDetailView: View {
    
    @StateObject var apiManager = APIManager()

    // item needs to be a struct
    // let item: String
    //let item: String   ###
    
    // change:    ###
    let state_race: Senate_Race
    
    init(state_race: Senate_Race) {
        self.state_race = state_race
        self.apiManager.getMarket()
    }
    
    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                    .frame(width: 400, height: 200)
                    .foregroundColor(.yellow)
                // change to Text(item.state)
                // Text(item)
                Text(state_race.state)
                    .foregroundColor(.black)
                    .font(.system(size: 60, weight: .bold))
            }
//            Text("\(state_race.id)")
            Text("D Candidate: \(state_race.candidate_d)")
                .foregroundColor(.black)
            Text("R Candidate: \(state_race.candidate_r)")
                .foregroundColor(.black)
            
        }
        .environmentObject(apiManager)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.494, saturation: 0.138, brightness: 0.964, opacity: 0.941))
//        Text(item)
//            .font(.system(size: 60))
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.cyan)
    }
}

struct StateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // StateDetailView(item: "Random")
        StateDetailView(state_race: Senate_Race(id: 0, state: "Ohio", candidate_d: "Tim Ryan (D)", candidate_r: "Lame-o (R)"))
    }
}
