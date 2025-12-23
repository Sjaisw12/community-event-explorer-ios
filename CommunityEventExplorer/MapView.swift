//
//  MapView.swift
//  CommunityEventExplorer
//
//  Created by Sanyam Jaiswal on 10/30/25.
//
import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        Group {
            if let coordinate = locationManager.userLocation {
                Map {
                    Marker("You", coordinate: coordinate)
                }
                .mapControls {
                    MapUserLocationButton()
                    MapCompass()
                }
            } else {
                ProgressView("Getting your location…")
            }
        }
        .navigationTitle("Event Map")
    }
}
