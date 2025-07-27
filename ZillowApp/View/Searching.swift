//
//  Searching.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 11.1.25..
//

import SwiftUI

struct Searching: View {
    @State private var tags: [String] = ["tag1", "tag2", "tag3"]
    @State private var newTag: String = ""
    @State private var selectedTab:String = "For Sale"
  
    @EnvironmentObject var locationManager : LocationManager
    
    @StateObject private var estateVM = EstateViewModel()
    @State private var history:[String] = [
        "Ocean Dr, Seaside",
       
    ]

    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.myBlue)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor:UIColor.white], for: .selected)
    }
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment:.top){
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width:20,height:25)
                        .foregroundStyle(Color.myBlue)
                        .onTapGesture {
                            dismiss()
                        }
                    VStack(alignment:.leading) {
                        ForEach(history,id:\.self){ tag in
                            HStack {
                                Text(tag)
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 4)
                                    .cornerRadius(8)
                                    .bold()
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.black)
                                    .padding(.leading, 4)
                                    .onTapGesture {
                                        removeTag(tag)
                                    }
                                
                            }
                            .padding(.horizontal)
                            .background(Color.gray.opacity(0.2))
                            
                            
                            
                        }
                        TextField("Home, feature, school, location...",text: $newTag)
                            .keyboardType(.default)
                            .autocapitalization(.none)
                            .textInputAutocapitalization(.none)
                    }
                    .frame(maxWidth:.infinity)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerSize: .zero)
                            .stroke(Color.black,lineWidth:1)
                    }
                }
                Button(action:{
                    dodajTag(newTag)
                    locationManager.location = newTag
                    
                    //newTag = ""
                }){
                    Text("Dodaj tag")
                }
                
                Divider()
                VStack {
                    Picker("Tab",selection: $selectedTab){
                        Text("For Sale").tag("For Sale")
                        Text("For Rent").tag("For Rent")
                        Text("Recently Sold").tag("Recently Sold")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(.vertical)
                Divider()
                ScrollView {
                    HStack {
                        Image(systemName: "location")
                        Text("Current Location")
                    }
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .padding(.vertical)
                    Divider()
                    Text("Search history").bold().frame(maxWidth:.infinity,alignment: .leading).padding(.vertical)
                    
                    ForEach(estateVM.locations,id:\.self){item in
                        HStack {
                            Image(systemName: "location")
                            Text(item)
                        }
                        .frame(maxWidth:.infinity,alignment: .leading)
                        .onTapGesture {
                            history.append(item)
                            locationManager.location = item
                            dismiss()
                            print(item)
                        }
                        Divider()
                        
                    }
                    Text("Suggested searches").bold().frame(maxWidth:.infinity,alignment: .leading).padding(.vertical)
                    
                    ForEach(history,id:\.self){item in
                        HStack {
                            Image(systemName: "location")
                            Text(item)
                        }
                        .frame(maxWidth:.infinity,alignment: .leading)
                        Divider()
                        
                    }
                }
                
            }
            .padding(.horizontal)
            .onAppear{
                estateVM.loadLocations()

            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
        
    
    private func removeTag(_ tag: String) {
        history.removeAll { $0 == tag }
    }
    private func dodajTag(_ tag:String){
        if !newTag.isEmpty {
            history.append(newTag)
        }
    }
}

#Preview {
    Searching()
        .environmentObject(LocationManager())
}
