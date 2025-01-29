//
//  MapOptionButton.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 13.1.25..
//
import SwiftUI

struct MapOptionButton: View {
    var iconName: String
    var label: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .padding(10)
                .background(Circle().fill(Color.gray.opacity(0.2)))
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .overlay {
                    Circle()
                        .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 3)
                }
                .onTapGesture {
                    action()
                }
            Text(label)
                .font(.subheadline)
                .foregroundStyle(isSelected ? Color.blue : Color.black)
        }
    }
}



