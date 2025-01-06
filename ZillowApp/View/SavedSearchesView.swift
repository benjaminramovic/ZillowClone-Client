//
//  SavedHomes.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 1.12.24..
//

import SwiftUI

struct SavedSearchesView: View {
    var body: some View {
        
        NavigationStack {
            VStack(spacing:20) {
                Image(.updates)
                    .resizable()
                    .frame(width: .infinity,height: 120,alignment: .center)
                    .padding(.top,200)
                
                Text("Save your search")
                    .font(Font.custom("AvenirLTStd-Black", size: 25))
                Text("Sign up to save searches and get updates on new listings and price cuts.")
                    .font(Font.custom("AvenirLTStd-Medium", size: 17))
                    
                    .foregroundStyle(Color.gray)
                    .multilineTextAlignment(.center)
                NavigationLink(destination: LoginRegisterView())
                    {
                    Text("Create an account")
                        .frame(width: 320)
                        .padding(10)
                        .background(Color.myBlue)
                        .foregroundStyle(Color.white)
                        .cornerRadius(8)
                        .font(Font.custom("AvenirLStd-Medium", size: 17))
                }
                .frame(width: .infinity)
                
                .padding(.horizontal)
                Spacer()
                HStack(alignment: .bottom) {
                    Text("Already saved a search?")
                        .foregroundStyle(.gray)
                        .font(Font.custom("AvenirLTStd-Medium", size: 17))
                    NavigationLink(destination: LoginView()){
                        Text("Sign in now.")
                            .foregroundStyle(Color.myBlue)
                            .font(Font.custom("AvenirLTStd-Medium", size: 17))
                    }
                    
                }
                .padding(.bottom,22)
                
            }
            .navigationBarTitle("Saved Searches")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    SavedSearchesView()
}
