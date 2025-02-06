//
//  TheDoersApp.swift
//  TheDoers
//
//  Created by Edu Caubilla on 4/2/25.
//

import FirebaseCore
import SwiftUI

@main
struct TheDoersApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

