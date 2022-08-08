//
//  Page3.swift
//  DonateWell
//
//  Created by Camilla B on 8/5/22.
//

import SwiftUI

struct Page3: View {
    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.yellow)
                Text("About")
                    .foregroundColor(.black)
                    .font(.system(size: 70, weight: .bold))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.494, saturation: 0.138, brightness: 0.964, opacity: 0.941))
    }
}

struct Page3_Previews: PreviewProvider {
    static var previews: some View {
        Page3()
    }
}
