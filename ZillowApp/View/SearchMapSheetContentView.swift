//
//  SearchMapSheetContentView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 2.12.24..
//

import SwiftUI

struct SearchMapSheetContentView: View {
    
    @State var estates: [EstateMain]

    var body: some View {
        VStack {
            ScrollView {
                ForEach(estates) {
                    estate in
                    EstateCard(estate: estate)
                }
            }
            
        }
    }
}
