//
//  DonateWellApp.swift
//  DonateWell
//
//  Created by Camilla B on 7/28/22.
//

import SwiftUI
import Firebase

@main
struct DonateWellApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
