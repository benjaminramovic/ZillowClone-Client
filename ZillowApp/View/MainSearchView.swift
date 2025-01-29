//
//  MainSearchView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 13.1.25..
//

import SwiftUI
import MapKit

struct MainSearchView: View {
    @State private var selectedImage: String = "map"
    @State private var selectedRisk: String = ""
    @State private var mapType: MKMapType = .standard

    let climateRisks = ["Flood", "Fire", "Wind", "Air", "Heat"]

    var body: some View {
        VStack {
           // MapOptionsView(selectedImage: $selectedImage, mapType: $mapType)
            //ClimateRisksView(climateRisks: climateRisks, selectedRisk: $selectedRisk)
        }
    }
}


#Preview {
    MainSearchView()
}
