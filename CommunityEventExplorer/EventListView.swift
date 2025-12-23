//
//  EventListView.swift
//  CommunityEventExplorer
//
//  Created by Sanyam Jaiswal on 10/30/25.
//
import SwiftUI

struct EventListView: View {
    @ObservedObject var vm: EventViewModel
    
    var body: some View {
        NavigationStack {
            if vm.isLoading {
                ProgressView("Loading events…")
            } else {
                List(vm.events) { event in
                    NavigationLink(destination: EventDetailView(event: event, vm: vm)) {
                        VStack(alignment: .leading) {
                            Text(event.name).bold()
                            Text(event.locationName).font(.subheadline)
                            Text(event.dateString).font(.caption)
                        }
                    }
                }
            }
        }
        .navigationTitle("Nearby Events")
    }
}
