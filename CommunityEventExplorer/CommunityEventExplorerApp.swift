//
//  CommunityEventExplorerApp.swift
//  CommunityEventExplorer
//
//  Created by Sanyam Jaiswal on 10/31/25.
//
import SwiftUI
import Firebase

@main
struct CommunityEventExplorerApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
