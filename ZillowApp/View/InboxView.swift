//
//  InboxView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 1.12.24..
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        NavigationStack {
            Spacer()
            VStack(spacing:20) {
                Image(.inbox)
                    .resizable()
                    .frame(width: .infinity,height: 70,alignment: .center)
                    .padding(.top,200)
                
                Text("Sign in to see your messages")
                    .font(Font.custom("AvenirLTStd-Black", size: 25))
                Text("Now, previous and future messages will be rigtht here.")
                    .font(Font.custom("AvenirLTStd-Medium", size: 17))
                    .foregroundStyle(Color.gray)
                    .multilineTextAlignment(.center)
                NavigationLink(destination:LoginView()) {
                    Text("Sign in now")
                        .padding(10)
                        .background(Color.myBlue)
                        .foregroundStyle(Color.white)
                        .cornerRadius(5)
                        .font(Font.custom("AvenirLTStd-Black", size: 17))
                }
                .frame(width: .infinity)
                
                .padding(.horizontal)
                Spacer()
              
                
            }
            .navigationTitle("Inbox")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    InboxView()
}
