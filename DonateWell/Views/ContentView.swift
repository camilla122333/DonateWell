//
//  ContentView.swift
//  DonateWell
//
//  Created by Camilla B on 7/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("2022 MIDTERMS")
                    // .font(Font.custom("Nanum", size: 18))
                    Image("donkey")
                }
                .foregroundColor(.black)
                .padding()
                Divider()
                WelcomeView()
                Spacer()
            }
            .background(Color(hue: 0.494, saturation: 0.138, brightness: 0.964, opacity: 0.941))
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


