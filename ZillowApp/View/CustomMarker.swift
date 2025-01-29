//
//  CustomMarker.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 5.1.25..
//

import SwiftUI

struct CustomMarker: View {
     @State var marker: EstateMain
    @Binding var current:Int
    @Binding var isVisible:Bool
    //@EnvironmentObject var locationManager : LocationManager
    @State var visited:[Bool] = [false,false,false,false,false,false,false,false,false,false]

    var body: some View {
        Text(String(Int(marker.price/1000))+"K")
            .padding(8)
            .background(
                current == marker.id
                    ? Color.green
                : (visited[marker.id]==true ? Color.red.opacity(0.5) : Color.red))
            

            .foregroundColor(Color.white)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .onTapGesture {
                current = marker.id
                isVisible = true
                visited[marker.id] = true
                //locationManager.visited[marker.id] = true
            }
            /*.alert(isPresented: $showAlert){
                Alert(title: Text("Kliknuli ste na marker sa id-em \(marker.id)!"))
            }*/
    }
}


