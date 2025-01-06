//
//  LoginView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 5.12.24..
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 20) {
                Divider()
                Text("Please enter your password")
                    
                    .font(Font.custom("AvenirLTStd-Medium", size: 17))
                SecureField("Password", text:.constant(""))
                    .frame(width: .infinity, height: 100)
                    .padding()
                    .overlay {
                        VStack {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundStyle(Color(.systemGray4))
                                .offset(y:25)
                                
                            Rectangle()
                                .frame(height: 2)
                                .foregroundStyle(Color(.systemGray4))
                                .offset(y:-25)
                            
                        }
                    }
               // Text("By tapping Submit, I accept Zillow's terms of use")
                    .font(.caption)
                    .foregroundStyle(.gray)
                VStack {
                    Button(action:{}){
                        Text("Submit")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(.white)
                            .background( Color.myBlue)
                    }
                    Text("Don't know your password?")
                        .font(Font.custom("AvenirLTStd-Medium", size: 17))
                        .foregroundStyle(Color.myBlue)
                        .padding()
                                            
                }
                .padding(.horizontal)
                Spacer()
                
            }
            
                .navigationBarTitle(Text("Sign in").font(Font.custom("AvenirLTStd-Black", size: 17)),displayMode: .inline)
                .navigationBarItems(trailing: HStack {
                    Button(action:{}){
                        Text("Next")
                            .foregroundStyle(.blue)

                    }
                })
            
        }
    }
}

#Preview {
    LoginView()
}
