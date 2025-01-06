//
//  CustomMarker.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 5.1.25..
//

import SwiftUI

struct CustomMarker: View {
    let marker: Marker
    @State private var showAlert = false

    var body: some View {
        Text(marker.price)
            .padding(8)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .onTapGesture {
                showAlert = true
            }
            .alert(isPresented: $showAlert){
                Alert(title: Text("Kliknuli ste na marker sa id-em \(marker.id)!"))
            }
    }
}

