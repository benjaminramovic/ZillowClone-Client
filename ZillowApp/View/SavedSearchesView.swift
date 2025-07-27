//
//  SavedHomes.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 1.12.24..
//

import SwiftUI

struct SavedSearchesView: View {
    @State var text:String=""
    let estates:[EstateMain] = [
        EstateMain(
                    id: 2,
                    title: "Cozy Studio",
                    description: "Perfect for students, near downtown.",
                    price: 75000.0,
                    location: "456 Small Street, Metro City",
                    estateType: "Studio",
                    forSale: false,
                    numberOfRooms: 1,
                    squareFootage: 30.0,
                    latitude: 48.8566,
                    longitude: 2.3522,
                    yearBuilt: 2010,
                    floor: 2,
                    heatingType: "Electric",
                    parkingSpaces: 0,
                    hasGarage: false,
                    hasGarden: false,
                    place: "Metro City",
                    imageURLs: ["https://via.placeholder.com/300"],
                    ownerName: "Jane Smith",
                    ownerContact: "jane.smith@example.com",
                    viewCount: 85,
                    days: 3,
                    numSaved: 10,
                    isFurnished: true,
                    isAvailable: true
                ),
        /*EstateMain(id: 2, title: "Nekretnina", description: "Opis", price: 1234, latitude: 41.1234, longitude: 50.1234)*/
    ]
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack() {
                    Divider()
                    HStack {
                        Text("Saved searches")
                            .bold()
                            .font(Font.custom("AvenirLTStd-Black", size: 23))
                        Spacer()
                        Text("Mark all as viewed")
                            .bold()
                            .foregroundStyle(Color.darkBlue)
                            .font(Font.custom("AvenirLTStd-Medium",size: 18)).bold()
                    }.padding()
                    HStack {
                        Text("My searches")
                            .bold()
                            .font(Font.custom("AvenirLTStd-Medium", size: 20)).bold()
                        Image(systemName: "chevron.right")
                        Spacer()
                        Text("3")
                            .padding(5)
                            .background(Color.orange)
                            .cornerRadius(50)
                        
                    }
                    .padding()
                    HStack {
                        TextField("For sale",text: $text)
                            .padding(7)
                            .cornerRadius(20)
                            .background(Color.gray.opacity(0.2))
                            .padding(
                            )
                        Spacer()
                        Image(systemName: "pencil")
                            .frame(alignment: .trailing)
                    }
                    .padding(.trailing)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack {
                            ForEach(estates){
                                estate in
                                EstateCard(estate: estate)
                                
                            }
                        }
                    }
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height:10)
                    HStack {
                        Text("Recently viewed")
                            .bold()
                            .font(.title3)
                        Image(systemName: "chevron.right")
                        Spacer()
                        
                    }
                    .padding()
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack {
                            ForEach(estates){
                                estate in
                                EstateCard(estate: estate)
                                
                            }
                        }
                    }
                    
                    /*Image(.updates)
                     .resizable()
                     .frame(width: .infinity,height: 120,alignment: .center)
                     .padding(.top,200)
                     
                     Text("Save your search")
                     .font(Font.custom("AvenirLTStd-Black", size: 25))
                     Text("Sign up to save searches and get updates on new listings and price cuts.")
                     .font(Font.custom("AvenirLTStd-Medium", size: 17))
                     
                     .foregroundStyle(Color.gray)
                     .multilineTextAlignment(.center)
                     NavigationLink(destination: LoginRegisterView())
                     {
                     Text("Create an account")
                     .frame(width: 320)
                     .padding(10)
                     .background(Color.myBlue)
                     .foregroundStyle(Color.white)
                     .cornerRadius(8)
                     .font(Font.custom("AvenirLStd-Medium", size: 17))
                     }
                     .frame(width: .infinity)
                     
                     .padding(.horizontal)
                     Spacer()
                     HStack(alignment: .bottom) {
                     Text("Already saved a search?")
                     .foregroundStyle(.gray)
                     .font(Font.custom("AvenirLTStd-Medium", size: 17))
                     NavigationLink(destination: LoginView()){
                     Text("Sign in now.")
                     .foregroundStyle(Color.myBlue)
                     .font(Font.custom("AvenirLTStd-Medium", size: 17))
                     }
                     
                     }
                     .padding(.bottom,22)*/
                    
                }
                .navigationBarTitle("Saved Searches")
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
}

#Preview {
    SavedSearchesView()
}
