//
//  Demo.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 12.1.25..
//

import SwiftUI

struct Demo: View {
    @StateObject var viewModel = EstateViewModel()
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.estates){estate in
                    VStack {
                        
                        Text(estate.title)
                        Text(String(estate.price))
                    }
                }
            }
            .navigationTitle("Estates")
            .onAppear {
                
            }
        }
       
    }
}

#Preview {
    Demo()
}
