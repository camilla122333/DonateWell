//
//  HomeView.swift
//  DonateWell
//
//  Created by Camilla B on 8/5/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                Text("2022 MIDTERMS")
                 .font(Font.custom("NanumPen", size: 25))
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
