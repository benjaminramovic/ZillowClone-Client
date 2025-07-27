//
//  EstateCard.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 15.12.24..
//

import SwiftUI

struct EstateSavedCard: View {
    let estate: EstateMain
    let isChecked:Bool
    @State private var isFavorite: Bool = true
    @State private var showSheet: Bool = false
    @State private var check: Bool = false
    //@Binding var present:Bool
    @StateObject var vm = EstateViewModel()
    @EnvironmentObject var auth:AuthenticationView

  
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                ImageSlider()
                HStack {
                    Spacer()
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        if !isChecked {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundStyle(!isFavorite ? .black.opacity(0.3) : Color.white)
                                .overlay {
                                    Image(systemName: "heart")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .foregroundStyle(.white)
                                }
                            
                                .onTapGesture {
                                    isFavorite.toggle()
                                    if let index = vm.savedEstates.firstIndex(of:estate){
                                        vm.savedEstates.remove(at: index)
                                    }
                                    vm.unsaveEstate(userId: auth.uid ?? 40, estateId: estate.id)
                                   
                                }
                           
                        }
                        else {
                            Image(systemName: check ? "checkmark.rectangle.fill" :  "rectangle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .onTapGesture {
                                    check.toggle()
                                }
                                .foregroundColor(check ? Color.myBlue : Color.white)
                        }
                    }
                }
                .padding()
                Spacer()
            }
            
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
                    Text("2")
                        .bold()
                    Text("bds")
                    Text("3")
                        .bold()
                    Text("ba")
                    Text("123")
                        .bold()
                    Text("sqft")
                    Text(estate.title)
                        .lineLimit(1) // Sprečava prelazak u novi red ako je tekst predugačak
                        .truncationMode(.tail) // Dodaje "..." ako je tekst predugačak
                    
                    Spacer()
                }
                
                HStack {
                    Text("adresa")
                        .font(Font.custom("AvenirLTStd-Medium", size: 17))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
        }
        .padding(.horizontal)
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(.white, lineWidth: 0.5)
                .shadow(color: .black, radius: 2)
                .padding(.horizontal)
        }
        .background(Color.white)
    
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

