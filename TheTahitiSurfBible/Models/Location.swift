//
//  Location.swift
//  TheTahitiSurfBible
//
//  Created by Jerad Acosta on 1/9/23.
//

import MapKit
import Foundation


struct SurfLocation: Identifiable, Equatable {
    
    let name: String
    let breakType: String
    let surferLevel: String
    let swell: String
    let tide: String
    let crowd: String
    let imageNames: [String]
    let about: String
    let localTip: String
    let town: String
    let report: String
    let coordinates: CLLocationCoordinate2D
    
    // Identifiable
    var id: String {
        name + town
    }
    
    // Equatable
    static func == (lhs: SurfLocation, rhs: SurfLocation) -> Bool {
        lhs.id == rhs.id
    }
    
}


struct ParkingLocation: Identifiable {
    
    let location: SurfLocation
    let coordinates: CLLocationCoordinate2D
    let imageNames: [String]
    let about: String
    
    // Identifiable
    var id: String {
        location.name + location.town + "parking"
    }
    
}
