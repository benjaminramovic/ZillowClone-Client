//
//  SavedHomesView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 1.12.24..
//

import SwiftUI

struct SavedHomesView: View {
    let buttons = [
        ("lines.measurement.horizontal","Filter"),
        ("checkmark.square","Compare")
    ]
    let estates:[EstateMain] = [
        EstateMain(id: 1, title: "Nekretnina", description: "Opis", price: 1234, latitude: 41.1234, longitude: 50.1234),
        EstateMain(id: 2, title: "Nekretnina", description: "Opis", price: 1234, latitude: 41.1234, longitude: 50.1234)
    ]
    @State var isFlipped = false
    @State private var showFilter:Bool = false
    @State private var showCompare:Bool = false
    
    @State private var isOn:Bool = false
    
    @State private var estatesForCompare:[EstateMain] = []
    
   
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack{
                Divider()
                NavigationLink(destination:EmptyView()){
                    HStack {
                        Image(systemName: "figure.walk")
                        Text("Manage tours").bold()
                            .font(Font.custom("AvenirLTStd-Medium", size: 18)).bold()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 15,height:20)
                        
                    }
                    .padding()
                }
                .foregroundStyle(Color.black)
                
                Divider()
                NavigationLink(destination:EmptyView()){
                    HStack {
                        Image(systemName: "message")
                        Text("Contacted rentals")
                            .font(Font.custom("AvenirLTStd-Medium", size: 18)).bold()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 15,height:20)
                    }
                    .padding()
                }
                .foregroundStyle(Color.black)
                Divider()
                NavigationLink(destination:EmptyView()){
                    HStack {
                        Image(systemName: "house")
                        Text("Claim your home")
                            .font(Font.custom("AvenirLTStd-Medium", size: 18)).bold()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 15,height:20)
                        
                    }
                    .padding()
                }
                .foregroundStyle(Color.black)
                Divider()
                HStack {
                        Button(action:{
                            
                        }){
                            NavigationLink(destination:SortView()){
                                HStack {
                                    Image(systemName: "slider.horizontal.2.square.badge.arrow.down")
                                    Text("Sort")
                                        .font(Font.custom("AvenirLTStd-Medium", size: 18)).bold()
                                }
                                .foregroundStyle(Color.black)
                            }
                        }
                        .padding()
                    
                    .overlay {
                        Rectangle()
                            .stroke(Color.black,lineWidth:1)
                    }
                
                    ForEach(buttons, id:\.0){button in
                        Button(action:{
                            if button.1 == "Filter" {
                                
                                showFilter.toggle()
                            }
                            if button.1 == "Compare" {
                                
                                showCompare.toggle()
                            }
                        }){
                            HStack {
                                Image(systemName: button.0)
                                Text(button.1)
                                    .font(Font.custom("AvenirLTStd-Medium", size: 18)).bold()
                            }
                            .foregroundStyle(Color.black)
                        }
                        .padding()
                        .overlay {
                            Rectangle()
                                .stroke(Color.black,lineWidth:1)
                        }
                        
                    }
                }
                .padding(.horizontal)
                if showFilter==true {
                    HStack {
                        
                        Toggle(isOn:$isOn){
                            Text("Show rentals only")
                        }
                    }.padding()
                        
                }
                Divider()
            }
            .transition(.move(edge: .top))
            .animation(.easeInOut, value:showFilter)
            VStack {
                Text("Your saves")
                    .frame(maxWidth:.infinity, alignment:.leading)
                    .font(Font.custom("AvenirLTStd-Black", size: 18)).bold()
                Text(String(estates.count) + " homes")
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .font(Font.custom("AvenirLTStd-Medium", size: 18))
                ScrollView{
                    ForEach(estates,id: \.self){estate in
                        EstateSavedCard(estate:estate,isChecked: showCompare)
                            .overlay {
                                if showCompare == true{
                                VStack {
                                    HStack {
                                        Spacer()
                                        Image(systemName:estatesForCompare.contains(where: { $0.id == estate.id }) ? "checkmark.rectangle.fill" : "rectangle.fill")
                                            .resizable().frame(width:40,height:40)
                                            .foregroundStyle(Color.myBlue)
                                            .onTapGesture {
                                                if estatesForCompare.contains(where: { $0.id == estate.id }) {
                                                    estatesForCompare.removeAll(where: { $0.id == estate.id })
                                                }
                                                else {
                                                    estatesForCompare.append(estate)
                                                }
                                            }
                                    }.padding(.trailing)
                                    Spacer()
                                }
                                
                                .padding()
                            }
                                
                            }
                    }
                }
            }
            .padding()
            .overlay {
                if showFilter==true {
                    Rectangle()
                        .fill(Color.black.opacity(0.3))
                        .frame(maxWidth:.infinity,maxHeight: .infinity)
                }
            }
            .overlay {
                if showCompare {
                    VStack {
                        HStack {
                            Text("Select 2-5 homes to compare")
                            Spacer()
                            NavigationLink(destination:CompareEstatesView(estates: estatesForCompare)){
                                Button(action:{}){
                                    Text("Compare")
                                }
                                .disabled(estatesForCompare.count >= 2 && estatesForCompare.count <= 5) //u zagradi kada nije disabled
                                .padding(7)
                                .background(estatesForCompare.count < 2 || estatesForCompare.count > 5 ? Color.gray : Color.myBlue)
                                .foregroundStyle(Color.white)
                                .cornerRadius(5)
                            }
                        }
                        .padding()
                        ScrollView(.horizontal, showsIndicators: false) {
                                     HStack(spacing: 10) {
                                         ForEach(estatesForCompare, id: \.self) { estate in
                                             EstateSavedCard(estate: estate, isChecked: showCompare)
                                                 .frame(width: 70, height: 70) // Postavljanje dimenzija sličica
                                                 .clipShape(RoundedRectangle(cornerRadius: 10))
                                                 .overlay(
                                                     Image(systemName: "xmark.circle.fill")
                                                         .foregroundColor(.red)
                                                         .padding(8)
                                                         .onTapGesture {
                                                             estatesForCompare.removeAll { $0.id == estate.id }
                                                         },
                                                     alignment: .topTrailing
                                                 )
                                         }
                                     }
                                     .padding(.horizontal)
                                 }
                    }
                    .frame(maxWidth:.infinity,maxHeight: .infinity)
                    .background(Color.white)
                        .padding(.top,UIScreen.main.bounds.height-600)
                        
                }
            }
            .toolbar {
                if showCompare {
                    ToolbarItem(placement: .principal){
                        Text("Compare saved homes").bold()
                    }
                    
                    ToolbarItem(placement:.topBarTrailing){
                        Text("Close").bold().foregroundStyle(Color.myBlue)
                            .onTapGesture {
                                showCompare = false
                            }
                        
                    }
                    
                }
                }
            
                
           
            
        }
        
        
        
        // .padding(.top,-50)
        
        
        
    }
    
    
    /*VStack(spacing:20) {
     Image(.saved)
     .resizable()
     .frame(width: .infinity,height: 120,alignment: .center)
     .padding(.top,200)
     
     Text("Save your favorite homes")
     .font(Font.custom("AvenirLTStd-Black", size: 25))
     Text("Sign up to save your favorite homes and get innstant alerts when they are updated.")
     .font(Font.custom("AvenirLTStd-Medium", size: 17))
     .foregroundStyle(Color.gray)
     .multilineTextAlignment(.center)
     .lineSpacing(10)
     NavigationLink(destination: LoginRegisterView()) {
     Text("Create an account")
     .frame(width: 320)
     .edgesIgnoringSafeArea(.all)
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
     Text("Already saved a home?")
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
     .navigationTitle("Saved Homes")
     .navigationBarTitleDisplayMode(.inline)
     */
    
    
    
}

       
 

#Preview {
    SavedHomesView()
}
