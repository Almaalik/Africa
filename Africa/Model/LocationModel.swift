//
//  LocationModel.swift
//  Africa
//
//  Created by Abdul Maalik on 06/09/23.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
    
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    //COMPUTED PROPETY
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
