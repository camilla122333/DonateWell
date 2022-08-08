//
//  ContentView.swift
//  DonateWell
//
//  Created by Camilla B on 7/28/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.shadowColor = .gray
            tabBarAppearance.backgroundColor = .black
            UITabBar.appearance().standardAppearance = tabBarAppearance
        }
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .tabItem({
                        Image(systemName: "house")
                        Text("Home")
                })
                TopFive()
                    .tabItem({
                        Image(systemName: "die.face.5.fill")
                        Text("Top 5 Races")
                    })
                
                Page3()
                    .tabItem({
                        Image(systemName: "heart")
                        Text("About")
                    })
            }
            .accentColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


