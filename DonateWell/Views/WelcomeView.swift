//
//  WelcomeView.swift
//  DonateWell
//
//  Created by Camilla B on 7/28/22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
            VStack {
                VStack(spacing: 40) {
                    VStack {
                        Text("DonateWellFake")
                            .font(.title)
    //                        .font(Font.custom("Nanum", size: 35))
                        Text("small-dollar political contributions")
                    }
                    .foregroundColor(.gray)

                    
                    Image("capitol2")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding()
                        .cornerRadius(10)
                        .foregroundColor(.cyan)
                    NavigationLink(destination: ListView()) {
                        Text("Simple Button")
//                        Button(action: {
//                            print("hi")
//                        }, label: {
//                            Text("Simple Button")
//                                .padding()
//                                .foregroundColor(Color.white)
//                                .background(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(lineWidth: 2)
//                                        .background(Color.orange)
//                                )
//                    })
                    }
                    .buttonStyle(.bordered)
                    Text("camilla 2022")
                }
                .multilineTextAlignment(.center)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
