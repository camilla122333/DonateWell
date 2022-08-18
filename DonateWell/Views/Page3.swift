//
//  Page3.swift
//  DonateWell
//
//  Created by Camilla B on 8/5/22.
//

import SwiftUI
import WebKit

//<a class="twitter-timeline" href="https://twitter.com/Politics_Polls?ref_src=twsrc%5Etfw">Tweets by Politics_Polls</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

struct Page3: View {
    
    @State var text = "<a class=\"twitter-timeline\" href=\"https://twitter.com/asterouter/lists/1560148054447034368?ref_src=twsrc%5Etfw\">A Twitter List</a> <script async src=\"https://platform.twitter.com/widgets.js\" charset=\"utf-8\"></script>"
    
    
    var body: some View {
        
        VStack(spacing: 40) {
            WebView(text: $text)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color(hue: 0.494, saturation: 0.138, brightness: 0.964, opacity: 0.941))
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct WebView: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(text, baseURL: nil)
    }
}

struct Page3_Previews: PreviewProvider {
    static var previews: some View {
        Page3()
    }
}
