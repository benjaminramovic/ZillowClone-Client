//
//  SavedEstatesListView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 26.7.25..
//

import SwiftUI

struct SavedEstatesListView: View {
    var estates: [EstateMain]
    var showCompare: Bool
    @Binding var estatesForCompare: [EstateMain]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your saves")
                .font(.custom("AvenirLTStd-Black", size: 18)).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("\(estates.count) homes")
                .font(.custom("AvenirLTStd-Medium", size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView {
                ForEach(estates, id: \.id) { estate in
                    EstateSavedCard(estate: estate, isChecked: showCompare)
                        .overlay {
                            if showCompare {
                                VStack {
                                    HStack {
                                        Spacer()
                                        Image(systemName: estatesForCompare.contains(where: { $0.id == estate.id }) ? "checkmark.rectangle.fill" : "rectangle.fill")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(Color.myBlue)
                                            .onTapGesture {
                                                if estatesForCompare.contains(where: { $0.id == estate.id }) {
                                                    estatesForCompare.removeAll(where: { $0.id == estate.id })
                                                } else {
                                                    estatesForCompare.append(estate)
                                                }
                                            }
                                    }
                                    .padding(.trailing)
                                    Spacer()
                                }
                                .padding()
                            }
                        }
                }
            }
        }
        .padding()
    }
}


