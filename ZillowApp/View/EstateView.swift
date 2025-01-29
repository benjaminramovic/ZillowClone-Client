//
//  EstateView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 17.1.25..
//

import SwiftUI

struct EstateView: View {
    let estate:EstateMain
    var images:[String] = ["est2","est3","updates"]
    @State private var presented:Bool = true

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
                VStack {
                    Text("$250,000")
                        .font(.title)
                        .bold()
                        .frame(maxWidth:.infinity, alignment: .leading)
                }
                .frame(maxHeight: .infinity)
                .padding()
                .overlay {
                    VStack {
                        Spacer()
                        HStack {
                            Button(action:{}){
                                Text("Contact")
                            }
                            Button(action:{}){
                                Text("Request a tour")
                            }
                        }
                    }
                    
                }
                .presentationDetents([.height(300)])
                .presentationDragIndicator(.visible)
                .cornerRadius(20)
            }
          
            VStack {
                
            HStack {
                HStack {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width:25,height: 25)
                        .cornerRadius(20)

                        .foregroundStyle(Color.black.opacity(0.6))
                }
                .padding(7)
                .background(Color.white.opacity(0.7))
                .cornerRadius(20)
                    
                Spacer()
              
                HStack {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width:25,height: 25)
                        .padding(.horizontal,7)
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .frame(width:25,height: 25)
                        .padding(.horizontal,7)
                    Image(systemName: "circle.slash")
                        .resizable()
                        .frame(width:25,height: 25)
                        .padding(.horizontal,7)
                    Image(systemName: "ellipsis")
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
    }
}

#Preview {
    EstateView(estate: EstateMain(id: 5, title: "Stann na prodaju", description: "Opis stana na prodaju", price: 125.500, latitude: 41.1234, longitude: 21.1123))
}


