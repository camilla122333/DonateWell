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
                        Text("DONATEWELL")
                            .font(Font.custom("NanumPen", size: 48))
                            .foregroundColor(Color.red)
                        Text("small-dollar political contributions")
                            .font(MyFont.body)
                    }
                    .foregroundColor(.gray)

                    
                    Image("capitol2")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding()
                        .cornerRadius(10)
//                        .foregroundColor(.cyan)
                    NavigationLink(destination: ListView()) {
                        Text("Start Donating")
                            .font(MyFont.medium)
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
                        .font(MyFont.medium)
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
