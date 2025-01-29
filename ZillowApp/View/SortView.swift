//
//  SortView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 22.1.25..
//

import SwiftUI

struct SortView: View {
    let options = [
        "Saved date",
        "Recently changed",
        "Newest",
        "Price: High to low",
        "Price: Low to high",
    ]
    @State private var selected = "Saved date"
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack(alignment:.leading) {
                ForEach(options,id:\.self){option in
                    HStack {
                        Text(option)
                            .frame(maxWidth:.infinity,alignment: .leading)
                        if selected==option {
                            Image(systemName: "checkmark")
                                .foregroundStyle(Color.myBlue)
                                .bold()
                        }
                    }
                    .padding()
                    .onTapGesture {
                        selected = option
                    }
                }


            }
            .frame(maxWidth:.infinity,alignment: .leading)
            .padding()
            Spacer()
            
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text("Sort order").bold()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Done").foregroundStyle(Color.myBlue)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
                
        }
    }
}

#Preview {
    SortView()
}
