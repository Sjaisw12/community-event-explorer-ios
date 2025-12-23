//
//  Event.swift
//  CommunityEventExplorer
//
//  Created by Sanyam Jaiswal on 10/30/25.
//
import Foundation

struct EventResponse: Codable {
    let embedded: EventsContainer
    
    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}

struct EventsContainer: Codable {
    let events: [Event]
}

struct Event: Identifiable, Codable {
    let id: String
    let name: String
    let url: String?
    let dates: EventDates
    let info: String?
    let _embedded: VenueContainer?
    var isBookmarked: Bool? = false
    
    var locationName: String {
        return _embedded?.venues.first?.name ?? "Unknown location"
    }
    
    var dateString: String {
        return dates.start.localDate ?? "N/A"
    }
}

struct EventDates: Codable {
    let start: EventStart
}

struct EventStart: Codable {
    let localDate: String?
}

struct VenueContainer: Codable {
    let venues: [Venue]
}

struct Venue: Codable {
    let name: String
    let latitude: String?
    let longitude: String?
}
