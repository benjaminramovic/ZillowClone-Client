//
//  LoginRegisterView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 4.12.24..
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

struct LoginRegisterView: View {
    @State private var email:String = ""
    @State private var password:String = ""

    @State private var loginError = ""
    @State private var isLoggedIn = false
    @EnvironmentObject var vm: AuthenticationView

    
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
                            
                           /* Button(action:{ login() }){
                                Label("Continue with Google", image: .google)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .foregroundStyle(.gray)
                                    .background(Color.white)
                                    .border(Color.gray, width: 2)
                                
                            }*/
                            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .light)){
                                
                                
                                vm.signInWithGoogle()
                            }
                            .padding(.bottom)
                            if !loginError.isEmpty{
                                Text(loginError)
                                    .foregroundColor(.red)
                                    .padding()
                            }
                            
                            NavigationLink(value: isLoggedIn){
                                EmptyView()
                            }
                            .navigationDestination(isPresented: $isLoggedIn){
                                ContentView()
                                    .navigationBarBackButtonHidden(true)
                            }
                            
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
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
        
            if let error = error {
                loginError = error.localizedDescription
            }
            
            isLoggedIn = true
        }
    }
}

#Preview {
    @StateObject var authView = AuthenticationView()

    LoginRegisterView()
        .environmentObject(authView)
}
