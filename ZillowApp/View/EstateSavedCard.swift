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
    EstateSavedCard(estate: EstateMain(id: 1, title: "Title", description: "Description", price: 123.5, latitude: 41.1234, longitude: 21.1123),isChecked: true)
}
