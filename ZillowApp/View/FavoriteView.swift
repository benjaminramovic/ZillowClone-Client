//
//  FavoriteView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 10.1.25..
//

import SwiftUI

struct FavoriteView: View {
    @State var isFlipped = false
    var body: some View {
        NavigationStack {
            VStack {
                if isFlipped {
                    SavedHomesView()
                        .rotation3DEffect(
                            Angle(degrees: isFlipped ? 180 : 0),
                            axis: (x: 0, y: 1, z: 0)
                        )
                }
                else {
                    SavedHomes2View()
                        .rotation3DEffect(
                        Angle(degrees: isFlipped ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                                                )
                }
            }
            .padding(.top,-50)
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text("Saved homes")
                        .bold()
                }
                
                ToolbarItem(placement: .topBarLeading){
                    Text(isFlipped ? "Map" : "List")
                        .foregroundColor(.myBlue)
                        .onTapGesture {
                            isFlipped .toggle()
                        }
                
                }
                
            }
            .rotation3DEffect(
                    Angle(degrees: isFlipped ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
                .animation(.easeInOut(duration: 0.8), value: isFlipped)
        }
    }
}

#Preview {
    FavoriteView()
}
