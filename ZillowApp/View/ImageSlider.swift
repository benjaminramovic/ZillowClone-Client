//
//  ImageSlider.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 6.12.24..
//

import SwiftUI

struct ImageSlider: View {
    @State private var selection=0
    var images:[String] = ["est2","est3","updates"]
    var body: some View {
        ZStack {
            TabView(selection: $selection){
                ForEach(0..<images.count,id: \.self){index in
                  Image("\(images[index])")
                        .resizable()
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(
                .page(backgroundDisplayMode: .always)
                
            )
        }
        .frame(height: 200)
    }
}

