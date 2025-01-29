//
//  CustomSheetView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 14.1.25..
//

import SwiftUI

import SwiftUI

struct CustomSheetView: View {
    @State private var offset: CGFloat = 300  // Početna visina sheet-a
    @State private var dragOffset: CGFloat = 0
    @State private var showSheet = false

    var body: some View {
        VStack {
            Spacer()

            // TabBar - Ovo je vaša glavna navigacija
            HStack {
                Spacer()
                Text("Tab View")
                    .padding()
                Spacer()
            }
            .frame(height: 60)
            .background(Color.blue)
            .foregroundColor(.white)

            // Glavni sadržaj
            Text("Main Content")
                .font(.largeTitle)
                .padding()
            
            Spacer()

            // Custom Sheet
            VStack {
                Spacer()
                VStack {
                    Text("Custom Sheet")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    // Ovdje možete staviti dodatne sadržaje za sheet
                    Text("Swipe up or down to move the sheet")
                        .padding()

                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .offset(y: offset + dragOffset) // Primjena pomaka za drag
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            dragOffset = value.translation.height
                        }
                        .onEnded { value in
                            let threshold: CGFloat = 150
                            if dragOffset > threshold {
                                // Ako je povučen prema dolje, sakrij sheet
                                withAnimation {
                                    offset = 300
                                }
                            } else if dragOffset < -threshold {
                                // Ako je povučen prema gore, prikaži sheet
                                withAnimation {
                                    offset = 0
                                }
                            }
                            dragOffset = 0
                        }
                )
            }
            .padding(.bottom, 10) // Padding ispod TabView
            .transition(.move(edge: .bottom))  // Transition za glatko kretanje
        }
        .onTapGesture {
            // Za slučaj kada želite da sakrijete sheet ako tapnete na glavni sadržaj
            withAnimation {
                offset = 300
            }
        }
    }
}




#Preview {
    CustomSheetView()
}
