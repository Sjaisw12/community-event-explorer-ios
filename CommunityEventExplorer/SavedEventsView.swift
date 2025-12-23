//
//  SavedEventsView.swift
//  CommunityEventExplorer
//
//  Created by Sanyam Jaiswal on 10/30/25.
//
import SwiftUI

struct SavedEventsView: View {
    @ObservedObject var vm: EventViewModel
    
    var body: some View {
        NavigationStack {
            if vm.savedEvents.isEmpty {
                Text("No saved events yet.")
                    .padding()
            } else {
                List(vm.savedEvents) { event in
                    VStack(alignment: .leading) {
                        Text(event.name).bold()
                        Text(event.locationName).font(.subheadline)
                    }
                }
            }
        }
        .navigationTitle("Saved Events")
    }
}

