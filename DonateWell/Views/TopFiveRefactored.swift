//
//  TopFiveRefactored.swift
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

struct TopFiveRefactored: View {
    @StateObject var dataManager = DataManager()
//    @StateObject var vm = ArrayModificationViewModel()
    @State var num = 1
    @State var filteredArray: [Senate_Race] = []

    var body: some View {
        VStack {
            Text("Recommended Donations")
                .foregroundColor(.gray)
                .font(.system(size: 20, weight: .bold))
            Spacer()
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(dataManager.races.filter { $0.isRecommended }) { election in
                        VStack(alignment: .leading) {
                            Text("\(String(num)). \(election.state)")
                                .font(.headline)
                                .padding(.horizontal)
                            HStack {
                                Text("Score: ")
                                    .padding(.horizontal)
                                Spacer()
                                if election.isRecommended {
                                    Image(systemName: "flame.fill")
                                        
                                        .padding(.horizontal)
                                        .foregroundColor(.orange)
                                }
                            }
                        }
                        .foregroundColor(.white)
                        .background(Color.gray.cornerRadius(10))
                        .padding(.horizontal)
                        //num += 1
                    }
                }
            }
        }
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

struct TopFiveRefactored_Previews: PreviewProvider {
    static var previews: some View {
        TopFiveRefactored()
    }
}
