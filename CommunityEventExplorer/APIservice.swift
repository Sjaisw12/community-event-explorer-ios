//
//  APIservice.swift
//  CommunityEventExplorer
//
//  Created by Sanyam Jaiswal on 11/24/25.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private let apiKey = "OSMKPyjCxG83m1rHhmcZsDgGCiFZmVcY"

    func fetchEvents(completion: @escaping ([Event]) -> Void) {
        let urlString =
        "https://app.ticketmaster.com/discovery/v2/events.json?apikey=\(apiKey)&city=phoenix&size=20"
        
        guard let url = URL(string: urlString) else {
            print(" Invalid URL")
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("API error:", error.localizedDescription)
                completion([])
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status code:", response.statusCode)
            }
            
            guard let data = data else {
                print("No data received")
                completion([])
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(EventResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decoded.embedded.events)
                }
            } catch {
                print("JSON decode error:", error)
                print("Raw response:", String(data: data, encoding: .utf8) ?? "No string")
                DispatchQueue.main.async {
                    completion([])   
                }
            }
            
        }.resume()
    }
}
