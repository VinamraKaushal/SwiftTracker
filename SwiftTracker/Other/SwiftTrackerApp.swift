//
//  SwiftTrackerApp.swift
//  SwiftTracker
//
//  Created by Vinamra Kaushal on 24/12/23.
//

import FirebaseCore
import SwiftUI

@main
struct SwiftTrackerApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
