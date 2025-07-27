//
//  EstateView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 17.1.25..
//

import SwiftUI

struct EstateView: View {
    @State var shareText = ""
    let estate:EstateMain
    var images:[String] = ["est2","est3","updates","est2"]
    @State private var presented:Bool = true
    @State private var isFavorite:Bool = false
    @EnvironmentObject var auth:AuthenticationView
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            VStack(spacing:0) {
                
                ScrollView {
                    ForEach(images,id:\.self){image in
                        Image(image)
                            .resizable()
                            .frame(width:.infinity,height:250)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $presented){
                
                EstateSheetView()
                .presentationDetents([.height(250),.large])
                .presentationDragIndicator(.visible)
                .cornerRadius(20)
                Spacer()
            }
            
          
            VStack {
                
            HStack {
                HStack {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width:25,height: 25)
                        .cornerRadius(20)

                        .foregroundStyle(Color.black.opacity(0.6))
                        .onTapGesture {
                           
                            dismiss()
                            
                        }
                }
                .padding(7)
                .background(Color.white.opacity(0.7))
                .cornerRadius(20)
                    
                Spacer()
              
                HStack {
                    Button(action: {
                        isFavorite.toggle()
                        
                    }) {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(!isFavorite ? .clear : Color.red)
                            .padding(.horizontal,7)
                            .overlay {
                                Image(systemName: "heart")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundStyle(!isFavorite ? .black.opacity(0.6) : Color.red)
                            }
                        
                    }

                    /*
                     ShareLink(item: shareText) {
                         Image(systemName: "square.and.arrow.up")
                             .resizable()
                             .frame(width: 25, height: 25)
                             .padding(.horizontal, 7)
                     }
                     */
                    ShareLink(
                        item: URL(string: "https://zillowapp.com/estate/\(estate.id)")!,
                        subject: Text(estate.title),
                            message: Text("Check out this estate: \(estate.title) - \(estate.description)"),
                            preview: SharePreview(
                                estate.title + ", " + estate.location,
                                image: Image("est2") // ovo je tvoja lokalna slika
                            )
                    ) {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.horizontal, 7)
                    }
                    Image(systemName: "circle.slash")
                        .resizable()
                        .frame(width:25,height: 25)
                        .padding(.horizontal,7)
                        
          
                }
                .padding(7)
                .background(Color.white.opacity(0.7))
                .cornerRadius(20)
                .foregroundStyle(Color.black.opacity(0.6))
               
                
            }
            .padding(.vertical,50)
            .padding(.horizontal,20)
                Spacer()
        }
            .padding(.vertical)
            
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            shareText = "\(estate.title) - \(estate.description)\nPrice: \(estate.price)€\nLocation: \(estate.location)"
        }
    }
}

#Preview {
    EstateView(estate: EstateMain(
        id: 1,
        title: "Modern Apartment",
        description: "Spacious apartment with a great city view.",
        price: 250000.0,
        location: "123 Main Street, Cityville",
        estateType: "Apartment",
        forSale: true,
        numberOfRooms: 3,
        squareFootage: 85.0,
        latitude: 41.9028,
        longitude: 12.4964,
        yearBuilt: 2015,
        floor: 5,
        heatingType: "Central",
        parkingSpaces: 1,
        hasGarage: true,
        hasGarden: false,
        place: "Cityville",
        imageURLs: [
            "https://via.placeholder.com/300",
            "https://via.placeholder.com/300"
        ],
        ownerName: "John Doe",
        ownerContact: "john.doe@example.com",
        viewCount: 120,
        days: 7,
        numSaved: 15,
        isFurnished: true,
        isAvailable: true
    ))
    .environmentObject(AuthenticationView())
}



