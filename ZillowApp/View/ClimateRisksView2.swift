//
//  ClimateRisksView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 13.1.25..
//

import SwiftUI

struct ClimateRisksView2: View {
    @Binding var selectedRisk: String
    let climateRisks: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Climate risks")
                .font(.system(size: 20))
                .bold()
            
            HStack(spacing: 15) {
                ForEach(climateRisks, id: \.self) { risk in
                    Text(risk)
                        .bold()
                        .font(.system(size: 16))
                        .padding(8)
                        .foregroundColor(selectedRisk == risk ? Color.blue : Color.black)
                        .overlay {
                            Rectangle()
                                .stroke(selectedRisk == risk ? Color.blue : Color.black, lineWidth: 2)
                        }
                        .onTapGesture {
                            selectedRisk = risk
                        }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}


