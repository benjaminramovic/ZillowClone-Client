//
//  LoginRegisterView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 4.12.24..
//

import SwiftUI

struct LoginRegisterView: View {
    @State private var email:String = ""
    var body: some View {
        NavigationView{
            VStack(spacing: 20) {
                Divider()
                Text("Enter your email to continue")
                    
                    .font(Font.custom("AvenirLTStd-Medium", size: 17))
                TextField("Email",text: .constant(""))
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
                //Text("By tapping continue, I accept Zillow's terms of use")
                    .font(.caption)
                VStack {
                    Button(action:{}){
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(.white)
                            .background(email.count>0 ? Color.myBlue : .gray)
                            .disabled(email.count>0)
                        
                    }
                    ZStack {
                        Divider()
                        Text("or")
                    }
                        VStack {
                            Button(action:{}){
                                
                                Label("Continue with Apple",systemImage: "apple.logo")
                                    
                                    .padding()
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.black)
                                    
                                    
                                
                            }
                            .edgesIgnoringSafeArea(.horizontal)
                            
                            Button(action:{}){
                                Label("Continue with Facebook", image: .facebook)
                                    
                                    .padding()
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.myBlue)
                                
                            }
                            Button(action:{}){
                                Label("Continue with Google", image: .google)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .foregroundStyle(.gray)
                                    .background(Color.white)
                                    .border(Color.gray, width: 2)
                                
                            }
                        
                    }
                        
                }
                .padding(.horizontal)
                Spacer()
                
            }
            
                .navigationBarTitle(Text("Register/Sign in").font(Font.custom("AvenirLTStd-Black", size: 17)),displayMode: .inline)
                .navigationBarItems(leading: HStack{
                    Button(action:{}){
                        Text("Cancel")
                    }
                }, trailing: HStack {
                    Button(action:{}){
                        Text("Next")
                            .disabled(email.count>0)
                            .foregroundStyle(email.count>0 ? .blue : .gray)

                    }
                })
            
        }
    
    }
}

#Preview {
    LoginRegisterView()
}
