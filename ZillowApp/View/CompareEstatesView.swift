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

#Preview {
    CompareEstatesView(estates: [
        EstateMain(id: 1, title: "Title", description: "Description", price: 123.5, latitude: 41.1234, longitude: 21.1123)
    ])
}
