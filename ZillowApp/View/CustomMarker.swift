//
//  CustomMarker.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 5.1.25..
//

import SwiftUI

struct CustomMarker: View {
    @StateObject var viewModel = EstateViewModel()
    @State var marker: EstateMain
    @Binding var current:Int
    @Binding var isVisible:Bool
    //@EnvironmentObject var locationManager : LocationManager
    @Binding var visited:[Int]
    var body: some View {
        ZStack {
            VStack {
                Text(String(Int(marker.price/1000))+"K")
                    .padding(8)
                    .background(
                        current == marker.id
                        ? Color.green
                        : (visited.contains(marker.id) ? Color.lightRed : Color.red))
                
                
                    .foregroundColor(Color.white)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 7)
                    .onTapGesture {
                        print("Kliknuto na marker: \(marker.id)")
                        current = marker.id
                        isVisible = true
                        if !visited.contains(marker.id) {
                            visited.append(marker.id)
                        }
                    }
                    .onChange(of: current){ newValue in
                        if(!visited.contains(newValue)){
                            visited.append(newValue)
                        }
                    }
      
                Triangle()
                    .fill(current == marker.id
                          ? Color.green
                          : (visited.contains(marker.id) ? Color.lightRed : Color.red))
                    .frame(width:13, height: 7)
                    .padding(.top,-8)
                   
                Text("\(marker.id)")
                /*.alert(isPresented: $showAlert){
                 Alert(title: Text("Kliknuli ste na marker sa id-em \(marker.id)!"))
                 }*/
            }
        }
    }
}


struct Triangle:Shape {
    func path(in rect: CGRect) -> Path {
            var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.minY))   // levi gornji ugao
              path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY)) // desni gornji ugao
              path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY)) // dno u sr
            path.closeSubpath()

            return path
        }
}
