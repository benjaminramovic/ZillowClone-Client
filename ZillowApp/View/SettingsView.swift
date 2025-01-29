//
//  SettingsView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 26.1.25..
//

import SwiftUI

struct SettingsView: View {
    @State var options = [
        ("person.fill","Profile"),
        ("bell","Notifications"),
        ("square.3.layers.3d.top.filled","Renter profile"),
        ("nosign","Hidden homes"),
        ("gearshape.fill","App settings"),
        ("message.fill","Help & feedback"),
        ("lock.fill","Privacy portal"),
        ("list.bullet","Terms of use")

        
    ]
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(options,id:\.0){option in
                    HStack {
                        Image(systemName:option.0)
                        Text(option.1)
                            .font(Font.custom("AvenirLTStd-Medium", size: 17))
                        Spacer()
                        Image(systemName:"chevron.right")
                    }
                    .foregroundStyle(Color.black.opacity(0.7))
                    .padding()
                    Divider()
                }
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement:.principal){
                    Text("Zillow account")
                        .font(Font.custom("AvenirLTStd-Medium", size: 17))
                        .bold()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
