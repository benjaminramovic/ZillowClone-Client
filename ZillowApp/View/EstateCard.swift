//
//  EstateCard.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 15.12.24..
//

import SwiftUI

struct EstateCard: View {
    @State private var isFavorite:Bool = false
    @State private var showSheet:Bool = false
    var body: some View {
        VStack {
            ZStack(alignment: .top){
                ImageSlider()
                HStack {
                    Spacer()
                    Button(action:{
                        isFavorite.toggle()
                    }){
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 35,height: 35)
                            .foregroundStyle(!isFavorite ? .black.opacity(0.3) : Color.white)
                            .overlay {
                                Image(systemName: "heart")
                                    .resizable()
                                    .frame(width: 35,height:35)
                                    .foregroundStyle(.white)
                                
                            }
                        
                    }
                }
                .padding()
                Spacer()
            }
            VStack(spacing:5) {
                HStack {
                    Text("225.000 US$")
                        .bold()
                        .font(Font.custom("AvenirLTStd-Black", size: 25))
                    Spacer()
                    Button(action:{}){
                        Image(systemName: "ellipsis")
                            .resizable()
                            .frame(width:20,height: 8)
                    }
                }
                HStack {
                    Text("2 ").bold()+Text("bds")+Text("  ")+Text("1 ").bold()+Text("ba")+Text("  ")+Text("910 ").bold()+Text("sqft")+Text("   ")+Text("Townhouse for sale")
                        
                    Spacer()
                        
                }
                
                HStack {
                    Text("1215 N Taney ST, Philadelphia, PA")
                        .font(Font.custom("AvenirLTStd-Medium", size: 17))
                        .frame(maxWidth:.infinity, alignment: .leading)
                }
                
            }
            .padding()
           
        }
        .padding(.horizontal)
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(.white, lineWidth: 0.5)
                .shadow(color:.black, radius: 2)
                .padding(.horizontal)
        }
        
        
    }
}

#Preview {
    EstateCard()
}
