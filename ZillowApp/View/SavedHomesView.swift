//
//  SavedHomesView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 1.12.24..
//

import SwiftUI

struct SavedHomesView: View {
    let buttons = [
        ("slider.horizontal.2.square.badge.arrow.down","Sort"),
        ("lines.measurement.horizontal","Filter"),
        ("checkmark.square","Compare")
    ]
    let estates:[Estate] = [
        Estate(price: "349.400 US$", bedrooms: 4, bathrooms: 2, area: 1.350, title: "Townhouse for sale", address: "3687 Stanton St, Philadelphia, PA"),
        Estate(price: "345.400 US$", bedrooms: 3, bathrooms: 3, area: 1.455, title: "Townhouse for rent", address: "3117 Stanton St, Philadelphia, PA"),
        ]
    
    var body: some View {
       
        NavigationStack {
            VStack {
                VStack{
                    Divider()
                    HStack {
                        Image(systemName: "figure.walk")
                        Text("Manage tours").bold()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 15,height:20)
                    }
                    .padding()
                    Divider()
                    HStack {
                        Image(systemName: "message")
                        Text("Contacted rentals").bold()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 15,height:20)
                    }
                    .padding()
                    Divider()
                    HStack {
                        Image(systemName: "house")
                        Text("Claim your home").bold()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 15,height:20)
                        
                    }
                    .padding()
                    Divider()
                    HStack {
                        ForEach(buttons, id:\.0){button in
                        Button(action:{}){
                            HStack {
                                Image(systemName: button.0)
                                Text(button.1)
                                    .bold()
                            }
                            .foregroundStyle(Color.black)
                        }
                        .padding()
                        .overlay {
                            Rectangle()
                                .stroke(Color.black,lineWidth:1)
                        }
                                
                        }
                    }
                    .padding(.horizontal)
                    Divider()
                }
                VStack {
                    Text("Your saves")
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .bold()
                    Text(String(estates.count) + " homes")
                        .frame(maxWidth:.infinity,alignment: .leading)
                    ScrollView{
                        ForEach(estates,id: \.self){estate in
                            EstateCard(estate:estate)
                        }
                    }
                }
                .padding()
                
            }
            .padding(.top,-50)
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text("Saved homes")
                        .bold()
                }
                
                ToolbarItem(placement: .topBarLeading){
                    Text("Map")
                        .foregroundColor(.myBlue)

                }
                
            }

            
            /*VStack(spacing:20) {
             Image(.saved)
             .resizable()
             .frame(width: .infinity,height: 120,alignment: .center)
             .padding(.top,200)
             
             Text("Save your favorite homes")
             .font(Font.custom("AvenirLTStd-Black", size: 25))
             Text("Sign up to save your favorite homes and get innstant alerts when they are updated.")
             .font(Font.custom("AvenirLTStd-Medium", size: 17))
             .foregroundStyle(Color.gray)
             .multilineTextAlignment(.center)
             .lineSpacing(10)
             NavigationLink(destination: LoginRegisterView()) {
             Text("Create an account")
             .frame(width: 320)
             .edgesIgnoringSafeArea(.all)
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
             Text("Already saved a home?")
             .foregroundStyle(.gray)
             .font(Font.custom("AvenirLTStd-Medium", size: 17))
             NavigationLink(destination: LoginView()){
             Text("Sign in now.")
             .foregroundStyle(Color.myBlue)
             .font(Font.custom("AvenirLTStd-Medium", size: 17))
             }
             
             }
             .padding(.bottom,22)
             
             }
             .navigationTitle("Saved Homes")
             .navigationBarTitleDisplayMode(.inline)
             */
            
            
            
        }

       
    }
}

#Preview {
    SavedHomesView()
}
