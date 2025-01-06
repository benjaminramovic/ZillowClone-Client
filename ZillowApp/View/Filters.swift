//
//  Filters.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 14.12.24..
//

import SwiftUI

struct Filters: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedMin = 0;
    @State private var selectedMax = 0;
    @State private var selectedBathroom = 0;
    let numbersMin = ["No Min","1","2"]
    let numbersMax = ["No Max","1","2"]
    let bathrooms = ["Any","1","2"]
    
    @State private var isOn = false


    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.myBlue)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor:UIColor.white], for: .selected)
    }
    @State private var lowerValue: Double = 20
       @State private var upperValue: Double = 80
       
       let minValue: Double = 0
       let maxValue: Double = 100
       let trackHeight: CGFloat = 4
       
       private var trackWidth: CGFloat {
           UIScreen.main.bounds.width - 12 // širina trake sa marginama
       }
       
       private var lowerThumbX: CGFloat {
           CGFloat((lowerValue - minValue) / (maxValue - minValue)) * trackWidth
       }
       
       private var upperThumbX: CGFloat {
           CGFloat((upperValue - minValue) / (maxValue - minValue)) * trackWidth
       }
    @State private var selectedTab:String = "For Sale"
    @State private var selectedTab2:String = "List price"

    var body: some View {
        NavigationStack {
            VStack(spacing:20){
                Picker("Tab",selection: $selectedTab){
                 Text("For Sale").tag("For Sale")
                 Text("For Rent").tag("For Rent")
                 Text("Recently Sold").tag("Recently Sold")
                 }
                 .pickerStyle(SegmentedPickerStyle())
                 
                VStack(alignment:.leading) {
                    Text("Price range")
                        .bold()
                        
                    Picker("Tab", selection: $selectedTab2){
                    Text("List price").tag("List price")
                    Text("Monthly payment").tag("Monthly payment")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    
                }
                ZStack {
                    // Traka
                    Rectangle()
                        .frame(width: 400, height: 2)
                        .foregroundColor(.myBlue)
                        .cornerRadius(trackHeight / 2)

                    // Prikaz trenutnih klizača
                   

                    
                }
                Divider()
                .padding(.horizontal, 100)
                .padding()
                
                VStack(alignment:.leading) {
                    Text("Bedrooms")
                        .bold()
                    HStack {
                        Picker(selection: $selectedMin, label: Text("No Min")) {
                            ForEach(0..<numbersMin.count, id: \.self) {
                                Text((numbersMin[$0]))
                                    .foregroundColor(.gray)
                                 }
                               }
                        .frame(maxWidth: .infinity)
                      
                        .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray, lineWidth: 2) // Sivi border
                                    )
                        
                        Picker(selection: $selectedMax, label: Text("No Max")) {
                            ForEach(0..<numbersMax.count, id: \.self) {
                                Text(String(numbersMax[$0]))
                                 }
                               }
                        .frame(maxWidth: .infinity)
                        .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray, lineWidth: 2) // Sivi border
                                    )
                        }
                    }
                VStack(alignment:.leading) {
                    Text("Bathrooms")
                        .bold()
                    HStack {
                        Picker(selection: $selectedBathroom, label: Text("No Min")) {
                            ForEach(0..<numbersMin.count, id: \.self) {
                                Text((bathrooms[$0]))
                                    .foregroundColor(.gray)
                                 }
                               }
                        .frame(maxWidth: .infinity)
                      
                        .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray, lineWidth: 2) // Sivi border
                                    )
                        }
                    }
                Divider()
                
                
                VStack(alignment:.leading) {
                    Text("Home type")
                        .bold()
                    Toggle(isOn:$isOn){
                        Text("Houses")
                            .foregroundColor(.black)
                    }
                    .toggleStyle(iOSCheckboxToggleStyle())
                    .frame(maxWidth:.infinity,alignment:.leadingFirstTextBaseline)
                    Toggle(isOn:$isOn){
                        Text("Townhouses")
                            .foregroundColor(.black)
                    }
                    .toggleStyle(iOSCheckboxToggleStyle())
                    .frame(maxWidth:.infinity,alignment:.leadingFirstTextBaseline)
                    Toggle(isOn:$isOn){
                        Text("Apartments")
                            .foregroundColor(.black)
                    }
                    .toggleStyle(iOSCheckboxToggleStyle())
                    .frame(maxWidth:.infinity,alignment:.leadingFirstTextBaseline)
                    
                }
                    
                    
                    
                }

            Spacer()
                
                 /*Text("Price range")
                 
                 
                 
                 
                 Divider()
                 Text("Bedrooms")
                 }*/
            .toolbar {
                /*ToolbarItem(placement: .topBarLeading){
                    Button(action:{
                        dismiss()
                    }){
                        Image(systemName: "chevron.backward")
                    }
                }*/
                ToolbarItem(placement: .principal){
                    Text("Filters")
                        .bold()
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button(action:{}){
                        Text("Reset")
                    }
                }
                ToolbarItem(placement: .bottomBar){
                    Button(action:{}){
                        Text("See 650 results")
                            .padding(6)
                            .bold()
                    }
                    .frame(maxWidth:.infinity)
                    .foregroundStyle(.white)
                    .background(Color.myBlue)
                    
                }
                
            }
                
            }
            .padding(.horizontal)
          
            
            
        
    }
}

#Preview {
    Filters()
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
        
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "checkmark.square.fill")
                .resizable()
                .frame(width:30,height:30)

                configuration.label
            
        })
    }
}
