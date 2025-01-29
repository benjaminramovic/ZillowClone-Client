//
//  SavedHomes2View.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 10.1.25..
//

import SwiftUI
import MapKit

struct SavedHomes2View: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 44.7866, longitude: 20.4489), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    let markers = [
          Marker(location: CLLocationCoordinate2D(latitude: 44.8176, longitude:20.4569), price: "$499K"),
          Marker(location: CLLocationCoordinate2D(latitude: 45.7634, longitude: 30.4289), price: "$1.2M"),
      ]
    @State private var isVisible2:Bool = false

    var body: some View {
        VStack {
            /*Map(coordinateRegion: $region, annotationItems: markers){ marker in
                /*MapMarker(coordinate: location.coordinate, tint:.red)*/
                MapAnnotation(coordinate: marker.location) {
                    CustomMarker(marker: marker, isVisible: $isVisible2)
                      
                
                }
                
            }*/
            Text("Hello")
        }
    }
}

#Preview {
    SavedHomes2View()
}
