//
//  Firebase_NetApp.swift
//  Firebase Net
//
//  Created by administrator on 30/08/2021.
//

import SwiftUI
import Firebase

@main
struct Firebase_NetApp: App {
	init() {
		FirebaseApp.configure()
	}
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
