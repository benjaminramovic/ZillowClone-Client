//
//  SavedHomesLinksView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 26.7.25..
//

import SwiftUI

struct SavedHomesHeaderView: View {
    @Binding var showFilter: Bool
    @Binding var showCompare: Bool
    @Binding var isOn: Bool
    
    let buttons = [
        ("slider.vertical.3","Filter"),
        ("checkmark.square","Compare")
    ]
    
    var body: some View {
        VStack {
            Divider()
            NavigationLink(destination: EmptyView()) {
                Label("Manage tours", systemImage: "figure.walk")
                    .font(.custom("AvenirLTStd-Medium", size: 18)).bold()
                    .padding()
            }
            Divider()
            NavigationLink(destination: EmptyView()) {
                Label("Contacted rentals", systemImage: "message")
                    .font(.custom("AvenirLTStd-Medium", size: 18)).bold()
                    .padding()
            }
            Divider()
            NavigationLink(destination: EmptyView()) {
                Label("Claim your home", systemImage: "house")
                    .font(.custom("AvenirLTStd-Medium", size: 18)).bold()
                    .padding()
            }
            Divider()
            
            HStack {
                NavigationLink(destination: SortView()) {
                    HStack {
                        Image(systemName: "slider.horizontal.2.square.badge.arrow.down")
                        Text("Sort")
                            .font(.custom("AvenirLTStd-Medium", size: 18)).bold()
                    }
                    .foregroundColor(.black)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 1))
                }
                
                ForEach(buttons, id: \.0) { button in
                    Button(action: {
                        if button.1 == "Filter" {
                            showFilter.toggle()
                        } else if button.1 == "Compare" {
                            showCompare.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: button.0)
                            Text(button.1)
                                .font(.custom("AvenirLTStd-Medium", size: 18)).bold()
                        }
                        .foregroundColor(.black)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 1))
                    }
                }
            }
            .padding(.horizontal)
            
            if showFilter {
                Toggle("Show rentals only", isOn: $isOn)
                    .padding()
            }
            Divider()
        }
    }
}
