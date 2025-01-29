//
//  MapOptionView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 13.1.25..
//

import SwiftUI
import MapKit

struct MapOptionsView2: View {
    @Binding var selectedImage: String
    @Binding var mapType: MKMapType

    var body: some View {
        VStack {
            HStack(spacing: 35) {
                MapOptionButton(iconName: "map", label: "Default", isSelected: selectedImage == "map") {
                    selectedImage = "map"
                    mapType = .standard
                }
                MapOptionButton(iconName: "globe", label: "Satellite", isSelected: selectedImage == "globe") {
                    selectedImage = "globe"
                    mapType = .satellite
                }
                MapOptionButton(iconName: "cube", label: "3D View", isSelected: selectedImage == "cube") {
                    selectedImage = "cube"
                    mapType = .hybrid
                }
            }
            .padding()
        }
    }
}


