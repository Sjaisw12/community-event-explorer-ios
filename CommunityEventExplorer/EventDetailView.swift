//
//  EventDetailView.swift
//  CommunityEventExplorer
//
//  Created by Sanyam Jaiswal on 10/30/25.
//
import SwiftUI

struct EventDetailView: View {
    var event: Event
    @ObservedObject var vm: EventViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(event.name).font(.title).bold()
                
                Text("📍 \(event.locationName)")
                Text("📅 \(event.dateString)")
                
                if let info = event.info {
                    Text(info)
                        .padding(.top)
                }
                
                Button {
                    vm.toggleBookmark(event: event)
                } label: {
                    Label(event.isBookmarked == true ? "Saved" : "Save Event",
                          systemImage: event.isBookmarked == true ? "heart.fill" : "heart")
                }
                .padding(.top)
                
                NavigationLink("View on Map") {
                    MapView()
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationTitle("Event Detail")
    }
}

