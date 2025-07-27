//
//  SavedHomesView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 1.12.24..
//

import SwiftUI

struct SavedHomesView: View {
    let buttons = [
        ("slider.vertical.3","Filter"),
        ("checkmark.square","Compare")
    ]
    @StateObject var viewModel = EstateViewModel()
   
    @State var isFlipped = false
    @State private var showFilter:Bool = false
    @State private var showCompare:Bool = false
    @State private var isOn:Bool = false
    
    @State private var estatesForCompare:[EstateMain] = []
    
    @EnvironmentObject var locationManager:LocationManager
    @EnvironmentObject var auth: AuthenticationView

    
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
                Text(String(viewModel.savedEstates.count) + " homes")
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .font(Font.custom("AvenirLTStd-Medium", size: 18))
                ScrollView{
                    ForEach(viewModel.savedEstates,id: \.self){estate in
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
            /*.overlay {
                if showFilter==true {
                    Rectangle()
                        .fill(Color.black.opacity(0.3))
                        .frame(maxWidth:.infinity,maxHeight: .infinity)
                }
            }*/
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
        
            
            .task {
                  
                viewModel.getSavedEstates(uid: 40)
                  
              }
           
            
        }
   
       
        
        
    }
 
    
}

       
 

#Preview {
  
        let locationManager = LocationManager()
        let auth = AuthenticationView()

        return SavedHomesView()
            .environmentObject(auth)
            .environmentObject(locationManager)
}
