//
//  ListView.swift
//  DonateWell
//
//  Created by Camilla B on 8/3/22.
//

import SwiftUI

struct ListView: View {
    @StateObject var dataManager = DataManager()
    
    var body: some View {
//        NavigationView {
            // List(dataManager.races, id: \.id) { senate_race in   ###
            List(dataManager.races) { senate_race in
                NavigationLink(
                    // this will be (item: senate_race)
                    // destination: StateDetailView(item: senate_race.state),  ###
                    destination: StateDetailView(state_race: senate_race),
                    label: {
                        Text(senate_race.state)
                        
                    }
                )
            }
            .navigationTitle("Senate Races")
//            .background(Color(hue: 0.494, saturation: 0.138, brightness: 0.964, opacity: 0.941))
//        }
        .environmentObject(dataManager)
    }
}

// preview's list view is not in a navigation view?
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}
