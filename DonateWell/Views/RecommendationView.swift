//
//  RecommendationView.swift
//  DonateWell
//
//  Created by Camilla B on 8/10/22.
//

import SwiftUI

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

    var body: some View {
        VStack (spacing: 20){
            Text("Recommended Donations")
                .foregroundColor(.black)
                .font(.system(size: 29, weight: .bold))
            Spacer()
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(dataManager.races.filter { $0.isRecommended }) { election in
                        HStack {
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
    //                                        .resizable()
    //                                        .frame(width: 40, height: 40)
                                            .padding(.horizontal)
                                            .foregroundColor(.cyan)
                                    }
                                }
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange.cornerRadius(10))
                            .padding(.horizontal)
                            VStack {
                                ZStack {
                                    
                                    Link(destination: URL(string: election.link)!) {
                                        Circle()
    //                                        .stroke(.black, lineWidth: 1)
                                            .frame(width: 50, height: 50)
                                        .foregroundColor(.white)
                                    }
                                    Image(systemName: "heart")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                        .foregroundColor(.black)
                                }
                                    
                                Text("Donate")
                                    .font(.system(size: 13))
                                    .foregroundColor(.red)
                                    
                            }
                        }
                        //num += 1
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

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView()
    }
}
