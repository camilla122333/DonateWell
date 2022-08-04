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
        NavigationView {
            List(dataManager.races) { senate_race in
                Text(senate_race.state)
                    .foregroundColor(.pink)
            }
            .navigationTitle("Senate Races")
        }
        .environmentObject(dataManager)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}
