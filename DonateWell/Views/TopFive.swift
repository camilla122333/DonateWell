//
//  TopFive.swift
//  DonateWell
//
//  Created by Camilla B on 8/5/22.
//

import SwiftUI

struct TopFive: View {
    var body: some View {
        VStack(spacing: 100) {
            Text("Top 5")
                .foregroundColor(.gray)
                .font(.system(size: 70, weight: .bold))
            VStack(spacing: 40){
                HStack(spacing: 40) {
                    Text("1. Arizona")
                        .foregroundColor(.teal)
                    .font(.system(size: 30))
                    Image("donkey")
                }
                HStack(spacing: 40) {
                    Text("2. Pennsylvania")
                        .foregroundColor(.teal)
                    .font(.system(size: 30))
                    Image("donkey")
                }
                HStack(spacing: 40) {
                    Text("3. Nevada")
                        .foregroundColor(.teal)
                    .font(.system(size: 30))
                    Image("donkey")
                }
                HStack(spacing: 40) {
                    Text("4. North Carolina")
                        .foregroundColor(.teal)
                    .font(.system(size: 30))
                    Image("donkey")
                }
                HStack(spacing: 40) {
                    Text("5. Colorado")
                        .foregroundColor(.teal)
                    .font(.system(size: 30))
                    Image("donkey")
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.494, saturation: 0.138, brightness: 0.964, opacity: 0.941))
        
    }
}

struct TopFive_Previews: PreviewProvider {
    static var previews: some View {
        TopFive()
    }
}
