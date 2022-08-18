//
//  GradientButtonStyleEffective.swift
//  DonateWell
//
//  Created by Camilla B on 8/17/22.
//

import SwiftUI

struct GradientButtonStyleEffective: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.black)
            .font(.body)
            .padding()
            .frame(width: 250, height: 100)
            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.pink]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
    
}

