//
//  TopFiveRefactored.swift
//  DonateWell
//
//  Created by Camilla B on 8/10/22.
//

import SwiftUI

struct SenateElection: Identifiable {
    let id = UUID().uuidString
    let name: String
    let score: Int
    let isRecommended: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var electionsArray: [SenateElection] = []
    @Published var filteredArray: [SenateElection] = []
    
    init() {
        getTop5()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        // sort
        
        // sort
        filteredArray = electionsArray.sorted { (election1, election2) -> Bool in
            return election1.score > election2.score
        }
        
//         sort - shortcut
//         filteredArray = electionsArray.sorted(by: {$0.score > $1.score})
        
        
        // filter
//        filteredArray = electionsArray.filter({ (election) -> Bool in
//            return election.score > 3 && election.isRecommended
//        })
        
        
    }
    
    func getTop5() {
        let el1 = SenateElection(name: "Arizona", score: 10, isRecommended: true)
        let el2 = SenateElection(name: "Pennsylvania", score: 8, isRecommended: true)
        let el3 = SenateElection(name: "Colorado", score: 6, isRecommended: true)
        let el4 = SenateElection(name: "Georgia", score: 10, isRecommended: true)
        let el5 = SenateElection(name: "North Carolina", score: 5, isRecommended: true)
        let el6 = SenateElection(name: "Florida", score: 1, isRecommended: false)
        let el7 = SenateElection(name: "Iowa", score: 1, isRecommended: false)
        let el8 = SenateElection(name: "Wisconsin", score: 9, isRecommended: true)
        self.electionsArray.append(contentsOf: [
            el1,
            el2,
            el3,
            el4,
            el5,
            el6,
            el7,
            el8
        ])
    }
    
}

struct TopFiveRefactored: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    @State var num = 1

    var body: some View {
        ScrollView {
            Text("Top 5")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .bold))
            Spacer()
            VStack(spacing: 20) {
                ForEach(vm.filteredArray) { election in
                    VStack(alignment: .leading) {
                        Text("\(String(num)). \(election.name)")
                            .font(.headline)
                            .padding(.horizontal)
                        HStack {
                            Text("Score: \(election.score)")
                                .padding(.horizontal)
                            Spacer()
                            if election.isRecommended {
                                Image(systemName: "flame.fill")
                                    .padding(.horizontal)
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.494, saturation: 0.138, brightness: 0.964, opacity: 0.941))
    }
}

struct TopFiveRefactored_Previews: PreviewProvider {
    static var previews: some View {
        TopFiveRefactored()
    }
}
