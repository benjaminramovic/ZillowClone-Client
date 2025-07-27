//
//  EstateCard.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 15.12.24..
//

import SwiftUI

struct EstateCard: View {
    let estate: EstateMain
    @State private var isFavorite: Bool = false
    @State private var showSheet: Bool = false

    @EnvironmentObject var auth:AuthenticationView
    @StateObject var vm = EstateViewModel()
    
    @State var tags1 = [
        "Price", "House size", "Style of home", "Layout"
         
    ]
    @State var tags2 = ["Living room", "Bedrooms", "Kitchen", "Bathrooms"]
    @State var tags3 = ["Backyard", "Location", "Commute", "Schools"]
    @State var selected:[String] = []
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                ImageSlider()
                HStack {
                    Spacer()
                    Button(action: {
                        isFavorite.toggle()
                        
                        if isFavorite==true {
                            
                            showSheet=true
                            
                            vm.saveEstate(userId: auth.uid ?? 40, estateId: estate.id)
                            
                            
                            
                            
                        }
                        else {
                            vm.unsaveEstate(userId: auth.uid ?? 40, estateId: estate.id)
                        }
                        
                    })
                    
                    {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundStyle( isFavorite ? Color.white : Color.black.opacity(0.3))
                        
                            .overlay {
                                Image(systemName: "heart")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundStyle(.white)
                            }
                        
                    }
                }
                .padding()
                Spacer()
            }
            NavigationLink(destination:EstateView(estate:estate)){
            VStack(spacing: 5) {
                HStack {
                    Text(String(estate.price))
                        .bold()
                        .font(Font.custom("AvenirLTStd-Black", size: 25))
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .frame(width: 20, height: 8)
                    }
                }
                
                HStack {
                    // Razdvojeni tekstovi za bolju efikasnost kompajlera
                    Text(String(estate.numberOfRooms))
                        .bold()
                    Text("bds")
                    Text(String(Int.random(in: 1..<4)))
                        .bold()
                    Text("ba")
                    Text(String(estate.squareFootage))
                        .bold()
                    Text("sqft")
                    Text(estate.title)
                        .lineLimit(1) // Sprečava prelazak u novi red ako je tekst predugačak
                        .truncationMode(.tail) // Dodaje "..." ako je tekst predugačak
                    
                    Spacer()
                }
                
                HStack {
                    Text(estate.location)
                        .font(Font.custom("AvenirLTStd-Medium", size: 17))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
        }
            .foregroundStyle(Color.black)
        }
        
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(.white, lineWidth: 0.5)
                .shadow(color: .black, radius: 2)
                
        }
        .background(Color.white)
        .sheet(isPresented: $showSheet){
            VStack(spacing:20){
                Circle()
                    .fill(Color.favoriteRed)
                    .frame(width:40, height: 40)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(Color.white)
                            .frame(width:27,height:27)
                    }
                Text("Home saved!")
                    .foregroundStyle(Color.favoriteGray)
                
                Text("I like this home because:")
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .foregroundStyle(Color.favoriteGray)
                HStack {
                    ForEach(tags1, id:\.self){val in
                     Text(val)
                            .font(.subheadline)
                            .onTapGesture {
                                if !selected.contains(val) {
                                    selected.append(val)
                                } 
                            }
                            .foregroundStyle(selected.contains(val) ? Color.myBlue : Color.black)
                    }
                } .frame(maxWidth:.infinity,alignment: .leading)
                HStack {
                    ForEach(tags2, id:\.self){val in
                     Text(val)
                            .font(.subheadline)
                
                    }
                } .frame(maxWidth:.infinity,alignment: .leading)
                HStack {
                    ForEach(tags3, id:\.self){val in
                     Text(val)
                            .font(.subheadline)
                    }
                } .frame(maxWidth:.infinity,alignment: .leading)
                
                Divider()
                Button(action:{}){
                    Text("Save my tags")
                }

                
                Spacer()
            }
            .padding()
            .padding(.bottom,0)
            .presentationDetents([.fraction(0.45)])
            
        }
      
        

    }
}

#Preview {
    EstateCard(estate: EstateMain(
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

