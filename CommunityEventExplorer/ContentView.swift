//
//  ContentView.swift
//  CommunityEventExplorer
//
//  Created by Sanyam Jaiswal on 10/30/25.
//
import SwiftUI

struct ContentView: View {
    @StateObject var vm = EventViewModel()

    var body: some View {
        TabView {
            EventListView(vm: vm)
                .tabItem { Label("Home", systemImage: "house.fill") }

            SearchView(vm: vm)
                .tabItem { Label("Search", systemImage: "magnifyingglass") }

            SavedEventsView(vm: vm)
                .tabItem { Label("Saved", systemImage: "heart.fill") }
        }
    }
}

