//
//  LocationsViewModel.swift
//  TheTahitiSurfBible
//
//  Created by Jerad Acosta on 1/9/23.
//

import MapKit
import SwiftUI
import Foundation

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var surfLocations: [SurfLocation]
    
    // For Static Map View Region
    @Published var mapLocation: SurfLocation
    
    // Current locations on map
    // For Interactively Changing Map View Region
//    @Published var mapLocation: SurfLocation {
//        didSet {
//            updateMapRegion(location: SurfLocation)
//        }
//    }
    
    // For Interactively Changing Map View Region
//    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    // For Static Map View Region
    @Published var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -17.6333, longitude: -149.51),
        span: MKCoordinateSpan(latitudeDelta: 0.8, longitudeDelta: 0.8))
    
    // For Interactively Changing Map View Region
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    // Show location detail via sheet
    @Published var sheetLocation: SurfLocation? = nil
    
    init() {
        let surfLocations = LocationsDataService.surfLocations
        self.surfLocations = surfLocations
        self.mapLocation = surfLocations.first!
        
        // For Interactively Changing Map View Region
//        self.updateMapRegion(location: surfLocations.first!)
    }
    
    // For Interactively Changing Map View Region
//    private func updateMapRegion(location: SurfLocation) {
//        withAnimation(.easeInOut) {
//            mapRegion = MKCoordinateRegion(
//                center: location.coordinates,
//                span: mapSpan)
//        }
//
//    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: SurfLocation) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        
        // Get the current index
        guard let currentIndex = surfLocations.firstIndex(where: {$0 == mapLocation }) else {
            print("Could not find current index in surfLocations array. Should never happen!")
            return
        }
        
        // Check if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard surfLocations.indices.contains(nextIndex) else {
            // Next index is not valid
            // Restart from 0
            guard let firstLocation = surfLocations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        // Next Index IS valid
        let nextLocation = surfLocations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
    func previousButtonPressed() {
        
        // Get the current index
        guard let currentIndex = surfLocations.firstIndex(where: {$0 == mapLocation }) else {
            print("Could not find current index in surfLocations array. Should never happen!")
            return
        }
        
        // Check if the currentIndex is valid
        let previousIndex = currentIndex - 1
        guard surfLocations.indices.contains(previousIndex) else {
            // Next index is not valid
            // Restart from 0
            guard let lastLocation = surfLocations.last else { return }
            showNextLocation(location: lastLocation)
            return
        }
        
        // Next Index IS valid
        let previousLocation = surfLocations[previousIndex]
        showNextLocation(location: previousLocation)
    }
    
}
