//
//  SearchView.swift
//  CommunityEventExplorer
//
//  Created by Sanyam Jaiswal on 10/30/25.
//
import SwiftUI

struct SearchView: View {
    @ObservedObject var vm: EventViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search events…", text: $vm.query)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                List(vm.filteredEvents) { event in
                    NavigationLink(destination: EventDetailView(event: event, vm: vm)) {
                        VStack(alignment: .leading) {
                            Text(event.name).bold()
                            Text(event.locationName).font(.subheadline)
                            Text(event.dateString).font(.caption)
                        }
                    }
                }
            }
            .navigationTitle("Search Events")
        }
    }
}
