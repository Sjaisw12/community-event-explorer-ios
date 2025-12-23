//
//  FirebaseManager.swift
//  CommunityEventExplorer
//
//  Created by Sanyam Jaiswal on 11/24/25.
//
import FirebaseFirestore
import Foundation

class FirebaseManager {
    static let shared = FirebaseManager()
    
    private let db = Firestore.firestore()
    
    func saveBookmark(event: Event) {
        let data: [String: Any] = [
            "id": event.id,
            "name": event.name,
            "date": event.dateString,
            "location": event.locationName
        ]
        
        db.collection("bookmarks")
            .document(event.id)
            .setData(data)
    }
    
    func removeBookmark(event: Event) {
        db.collection("bookmarks")
            .document(event.id)
            .delete()
    }
    
    func fetchBookmarks(completion: @escaping ([Event]) -> Void) {
        db.collection("bookmarks").getDocuments { snapshot, error in
            var events: [Event] = []
            
            guard let docs = snapshot?.documents else { return }
            
            for doc in docs {
                let data = doc.data()
                
                let event = Event(
                    id: data["id"] as? String ?? UUID().uuidString,
                    name: data["name"] as? String ?? "",
                    url: nil,
                    dates: EventDates(start: EventStart(localDate: data["date"] as? String)),
                    info: nil,
                    _embedded: VenueContainer(venues: []),
                    isBookmarked: true
                )
                
                events.append(event)
            }
            
            completion(events)
        }
    }
}

