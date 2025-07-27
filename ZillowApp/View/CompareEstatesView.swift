//
//  CompareEstatesView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 22.1.25..
//

import SwiftUI

struct CompareEstatesView: View {
    let estates:[EstateMain]
    var body: some View {
        ForEach(estates){estate in
            Text("\(estate.id) -> \(estate.title)")
        }
    }
}



