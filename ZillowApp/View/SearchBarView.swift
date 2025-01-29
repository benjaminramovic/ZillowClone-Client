//
//  SearchBarView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 13.1.25..
//

import SwiftUI

struct SearchBarView: View {
    @State var currentLocation = ""
    @EnvironmentObject var locationManager:LocationManager

    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.gray)
                            NavigationLink(destination:Searching()){
                                HStack {
                                    Text(locationManager.location)
                                        .padding(.horizontal, 6)
                                        .padding(.vertical, 4)
                                        .cornerRadius(8)
                                        .bold()
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.black)
                                        .padding(.leading, 4)
                                       
                                    
                                }
                                .padding(.horizontal)
                                .background(Color.gray.opacity(0.2))
                                TextField("Home feature, school, location",text: .constant(""))
                                    .padding(8)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray)
                                    }
                            }
                        
                            NavigationLink(destination:Filters()){
                                Image(systemName: "lines.measurement.horizontal")
                                    .foregroundStyle(Color.myBlue)
                            }
                            
                            
                        }
                        .padding(.horizontal)
    }
}

#Preview {
    SearchBarView()
        .environmentObject(LocationManager())

}
