//
//  RecommendationView.swift
//  DonateWell
//
//  Created by Camilla B on 8/10/22.
//

import SwiftUI
import WebKit

// rename
//class ArrayModificationViewModel: ObservableObject {
//
//    @StateObject var dataManager = DataManager()
////    @Published var electionsArray: [SenateElection] = []
//    @Published var filteredArray: [Senate_Race] = []
//    @Published var electionsList: [Senate_Race] = []
//
////    init() {
////        updateFilteredArray()
////    }
//
//    func updateFilteredArray() {
//        electionsList = dataManager.races
//
//        filteredArray = electionsList.sorted(by: {
//            $0.isRecommended && !$1.isRecommended
//        })
//        print("FILTERED ARRAY****: \(filteredArray)")
//    }
//
//}

struct RecommendationView: View {
    @StateObject var dataManager = DataManager()
//    @StateObject var vm = ArrayModificationViewModel()
    @State var num = 1
    @State var filteredArray: [Senate_Race] = []
    @State private var showActBlueView = false

    var body: some View {
        VStack (spacing: 20){
            Text("Recommended Donations")
                .foregroundColor(.black)
                .font(.system(size: 29, weight: .bold))
            Spacer()
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(dataManager.races.filter { $0.isRecommended }) { election in
                        HStack (spacing: 5) {
                            VStack(alignment: .leading) {
                                Text(election.state)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                HStack {
                                    Text(election.candidate_d)
                                        .padding(.horizontal)
                                    Spacer()
                                    if election.isRecommended {
                                        Image(systemName: "star.fill")
                                            .padding(.horizontal)
                                            .foregroundColor(.cyan)
                                    }
                                }
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange.cornerRadius(10))
                            .padding(.horizontal)
                            VStack(spacing: 12) {
                                
                                Button(action: {
                                    showActBlueView.toggle()
                                    }, label: {
                                        Image(systemName: "heart")
                                            .resizable()
                                            .frame(width: 28, height: 28)
                                            .foregroundColor(.black)
                                            .background(
                                                Circle()
                                                    .frame(width: 45, height: 45)
                                                .foregroundColor(.white)
                                            )
                                    }
                                )
                                .sheet(isPresented: $showActBlueView) {
                                    WebViewActBlue(url: URL(string: election.link)!)
                                }
                                                                
                                Text("Donate")
                                    .font(.system(size: 13))
                                    .foregroundColor(.red)
                                    
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.494, saturation: 0.138, brightness: 0.964, opacity: 0.941))
    }
        
//    func updateFilteredArray() {
//        let electionsArr = dataManager.races
//        filteredArray = electionsArr.sorted(by: {
//            $0.isRecommended && !$1.isRecommended
//        })
//        print("FILTERED ARRAY****: \(filteredArray)")
//    }
}

struct WebViewActBlue: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
 }

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView()
    }
}
