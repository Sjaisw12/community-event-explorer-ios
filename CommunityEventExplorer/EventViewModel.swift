//
//  EventViewModel.swift
//  CommunityEventExplorer
//
//  Created by Sanyam Jaiswal on 10/30/25.
//

import Foundation

class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var savedEvents: [Event] = []
    @Published var query: String = ""
    @Published var isLoading = true
    
    init() {
        fetchEventsFromAPI()
        loadBookmarks()
    }
    func fetchEventsFromAPI() {
        isLoading = true
        
        APIService.shared.fetchEvents { events in
            DispatchQueue.main.async {
                self.events = events
                self.isLoading = false
            }
        }
    }
    var filteredEvents: [Event] {
        if query.isEmpty { return events }
        return events.filter { $0.name.lowercased().contains(query.lowercased()) }
    }
   
    func toggleBookmark(event: Event) {
        
        if event.isBookmarked == true {
            FirebaseManager.shared.removeBookmark(event: event)
            savedEvents.removeAll { $0.id == event.id }
        } else {
            FirebaseManager.shared.saveBookmark(event: event)
            savedEvents.append(event)
        }
        
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index].isBookmarked?.toggle()
        }
    }
    
    func loadBookmarks() {
        FirebaseManager.shared.fetchBookmarks { bookmarks in
            DispatchQueue.main.async {
                self.savedEvents = bookmarks
            }
        }
    }
}
