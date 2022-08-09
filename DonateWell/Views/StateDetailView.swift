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
            
        }
        .onAppear() {
            apiManager.getMarket()
        }
//        .environmentObject(apiManager)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.494, saturation: 0.138, brightness: 0.964, opacity: 0.941))
    }
}

struct StateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StateDetailView(state_race: Senate_Race(id: 0, state: "Ohio", candidate_d: "Tim Ryan (D)", candidate_r: "Lame-o (R)"))
    }
}
