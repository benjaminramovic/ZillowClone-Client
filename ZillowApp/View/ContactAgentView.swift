//
//  ContactAgentView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 3.8.25..
//

import SwiftUI

struct ContactAgentView: View {
    @State var name:String = ""
    @State var phone:String = ""
    @State var email:String = ""
    @State var message:String = "I am interested in this estate (change with real info)"
    @State var wantInfos:Bool = true

    @Environment(\.dismiss) var dismiss


    var body: some View {
        NavigationView {
            VStack {
                Divider()
               
                HStack {
                    Image(systemName:"info.circle.fill")
                        .resizable()
                        .frame(width:22, height:22)
                        .foregroundStyle(Color.darkBlue)
                    Text("Connect with a local buyer's agent.")
                        
                    
                }
                .padding()
                .frame(maxWidth:.infinity, alignment: .leading)
                .background(Color.skyBlue.opacity(0.5))

                .overlay (
                    RoundedRectangle(cornerRadius:3)
                        .stroke(Color.darkBlue, lineWidth:1.5)
                        
                        
                )
                .padding(.top, 20)
                
                VStack(alignment: .leading, spacing: 20){
                    VStack {
                        Text("Name")
                            .font(Font.custom("AvenirLTStd-Black", size: 17))
                            .frame(maxWidth:.infinity, alignment:.leading)
                        TextField("", text: $name)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                   
                    VStack {
                        Text("Phone") .font(Font.custom("AvenirLTStd-Black", size: 17))
                            .frame(maxWidth:.infinity, alignment:.leading)
                        TextField("", text: $phone)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.black, lineWidth: 1)
                            )}
                    VStack {
                        Text("Email") .font(Font.custom("AvenirLTStd-Black", size: 17))
                            .frame(maxWidth:.infinity, alignment:.leading)
                        TextField("", text: $email)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.black, lineWidth: 1)
                            )}
                    VStack {
                        Text("Message") .font(Font.custom("AvenirLTStd-Black", size: 17))
                            .frame(maxWidth:.infinity, alignment:.leading)
                        TextEditor(text: $message)
                            .padding(10)
                            .frame(height: 150)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.black, lineWidth: 1)
                            )}
                    Button(action:{
                       
                    }){
                        Text("Contact agent")
                            .padding()
                            .frame(maxWidth:.infinity, alignment:.center)
                            .bold()
                            .font(.title3)
                        
                            
                    }
                    .foregroundStyle(name.isEmpty || phone.isEmpty || email.isEmpty || message.isEmpty ? Color.black.opacity(0.5) : Color.white)
                    .background(name.isEmpty || phone.isEmpty || email.isEmpty || message.isEmpty ? Color.gray.opacity(0.2) : Color.myBlue)
                    
                    
                    .disabled(name.isEmpty || phone.isEmpty || email.isEmpty || message.isEmpty)
                    
                    HStack(spacing: 15) {
                        Image(systemName: wantInfos ? "checkmark.square.fill" : "square")
                            .resizable()
                            .frame(width:27, height:27)
                            .foregroundStyle(Color.myBlue)
                            .onTapGesture {
                                wantInfos.toggle()
                            }
                        Text("I want financing information.")
                    }
                }
                .padding(.vertical)
               
                Spacer()
            }
            .padding(.horizontal)
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Image(systemName:"xmark")
                        .resizable()
                        .frame(width:25, height: 25)
                        .onTapGesture {
                            dismiss()
                        }
                }
                ToolbarItem(placement: .principal){
                    Text("Contact a Buyer's Agent")
                        .font(Font.custom("AvenirLTStd-Black", size: 22))
                 
                }
            }
        }
      
    }
}

#Preview {
    ContactAgentView()
}
