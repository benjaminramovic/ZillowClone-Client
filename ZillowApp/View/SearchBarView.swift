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
    
    @StateObject var estateViewModel = EstateViewModel()

    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.gray)
            NavigationLink(destination:Searching()){
                HStack {
                    HStack {
                        Text(locationManager.location ?? "Beograd")
                            .padding(.vertical,3)
                            .padding(.horizontal,2)
                            .cornerRadius(8)
                            .bold()
                            .font(.subheadline)
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.black)
                            .padding(.leading, 4)
                        
                        
                    }
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    TextField("Home feature, school, location",text: .constant(""))
                        .padding(8)
                }
                .padding(.horizontal,5)
                .padding(.vertical,3)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray)
                }
               
                            }
                        
                            NavigationLink(destination:Filters()){
                                Image(systemName: "slider.vertical.3")
                                    .resizable()
                                    .frame(width:25,height: 25)
                                    .foregroundStyle(Color.myBlue)
                                    
                            }
                            
                            
                        }
                        .padding(.horizontal)
        
                        .onAppear {
                            estateViewModel.loadLocations()
                        }
                       
    }
}

#Preview {
    SearchBarView()
        .environmentObject(LocationManager())

}
