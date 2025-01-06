//
//  Marker.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 5.1.25..
//

import Foundation
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    let location: CLLocationCoordinate2D
    let price: String
}
