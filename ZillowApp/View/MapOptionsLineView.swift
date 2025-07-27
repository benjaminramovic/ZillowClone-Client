//
//  MapOptionsLineView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 13.1.25..
//

import SwiftUI
import MapKit

struct MapOptionsLineView: View {
    @State private var showSheet2:Bool = false
    @State private var selectedImage:String = "map"
    @State private var selectedRisk:String = ""
    @State private var selectedAnemity:String = ""
    @Binding var presented:Bool


    @State private var isOn:Bool = false
    
    @State private var mapType: MKMapType = .standard
    @State private var isVisible2:Bool = false
    
    @Binding var region: MKCoordinateRegion

    let climateRisks = ["Flood","Fire","Wind","Air","Heat"]
    let amenities:[String] = ["Banks","Coffee shops","Gas","Grocers"]
    let amenitiesIcons:[String] = ["dollarsign","mug.fill","fuelpump","cart",]

    @Binding var option:Int
    
    var body: some View {
        HStack {
            HStack{
                Button(action: {
                    let newSpan = MKCoordinateSpan(
                        latitudeDelta: max(region.span.latitudeDelta / 2, 0.001),
                        longitudeDelta: max(region.span.longitudeDelta / 2, 0.001)
                    )
                    region.span = newSpan
                }) {
                    Image(systemName: "plus.magnifyingglass")
                }
                .padding(7)
                .background(Color.white)
                .foregroundStyle(Color.black)
                .cornerRadius(20)
                .font(.system(size: 23))
                .shadow(radius: 13)

                Button(action: {
                    let newSpan = MKCoordinateSpan(
                        latitudeDelta: min(region.span.latitudeDelta * 2, 180),
                        longitudeDelta: min(region.span.longitudeDelta * 2, 180)
                    )
                    region.span = newSpan
                }) {
                    Image(systemName: "minus.magnifyingglass")
                }
                .padding(7)
                .background(Color.white)
                .foregroundStyle(Color.black)
                .cornerRadius(20)
                .font(.system(size: 23))
                .shadow(radius: 13)

                Button(action: {
                    showSheet2 = true
                }){
                    Image(systemName: "square.3.layers.3d")
                }
                .sheet(isPresented:$showSheet2){
                    VStack {
                        HStack{
                            Text("Map options")
                                .bold()
                                .frame(maxWidth:.infinity,alignment:.leading)
                            
                            
                            Image(systemName: "x.circle")
                                .foregroundStyle(.gray)
                                .onTapGesture {
                                    showSheet2 = false
                                }
                            
                        }
                        .padding()
                        Divider()
                        HStack(spacing:35) {
                            VStack {
                                Image(systemName:"map")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(10)
                                    .background(Circle().fill(Color.gray.opacity(0.2)))
                                    .clipShape(Circle())
                                    .frame(width:60,height:60)
                                    .overlay {
                                        Circle()
                                            .stroke(selectedImage == "map" ? Color.blue : Color.clear,lineWidth:3)
                                    }
                                    .onTapGesture {
                                        selectedImage = "map"
                                        mapType = .standard
                                        option = 1
                                    }
                                Text("Default")
                                    .font(.subheadline)
                                    .foregroundStyle(selectedImage == "map" ? Color.blue : Color.black)
                            }
                            VStack {
                                Image(systemName:"globe")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(10)
                                    .background(Circle().fill(Color.gray.opacity(0.2)))
                                    .clipShape(Circle())
                                    .frame(width:60,height:60)
                                    .overlay {
                                        Circle()
                                            .stroke(selectedImage == "globe" ? Color.blue : Color.clear,lineWidth:3)
                                    }
                                    .onTapGesture {
                                        selectedImage = "globe"
                                        mapType = .satellite
                                        option = 2
                                    }
                                Text("Satelite")
                                    .font(.subheadline)
                                    .foregroundStyle(selectedImage == "globe" ? Color.blue : Color.black)
                            }
                            VStack {
                                Image(systemName:"cube")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(10)
                                    .background(Circle().fill(Color.gray.opacity(0.2)))
                                    .clipShape(Circle())
                                    .frame(width:60,height:60)
                                    .overlay {
                                        Circle()
                                            .stroke(selectedImage == "cube" ? Color.blue : Color.clear,lineWidth:3)
                                    }
                                    .onTapGesture {
                                        selectedImage = "cube"
                                        mapType = .hybrid
                                        option = 3
                                    }
                                Text("3D View")
                                    .font(.subheadline)
                                    .foregroundStyle(selectedImage == "cube" ? Color.blue : Color.black)
                            }
                        }
                        .padding()
                        Divider()
                        VStack(alignment:.leading) {
                            Text("Climate risks")
                                .font(.system(size:20))
                                .bold()
                            
                            
                            HStack(spacing:15) {
                                ForEach(climateRisks,id:\.self){risk in
                                    Text(risk)
                                    
                                        .bold()
                                        .font(.system(size:16))
                                        .padding(8)
                                        .foregroundColor(selectedRisk==risk ? Color.blue : Color.black)
                                        .overlay {
                                            Rectangle()
                                                .stroke(selectedRisk==risk ? Color.blue : Color.black,lineWidth:2)
                                            
                                            
                                        }
                                        .onTapGesture {
                                            selectedRisk = risk
                                        }
                                }
                            }
                            // Poravnanje celog HStack-a
                            
                        }
                        .frame(maxWidth:.infinity,alignment:.leading)
                        .padding(.horizontal)
                        
                        Divider()
                        VStack {
                            HStack {
                                Text("Neighborhood amenities")
                                    .bold()
                                    .font(.system(size:20))
                                    .frame(maxWidth:.infinity,alignment:.leading)
                                Toggle("", isOn:$isOn)
                                    .labelsHidden()
                                
                            }
                            if isOn {
                                HStack(spacing:15) {
                                    VStack {
                                        Image(systemName:"cart")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(10)
                                            .background(Circle().fill(Color.gray.opacity(0.2)))
                                            .clipShape(Circle())
                                            .frame(width:40,height:40)
                                            .overlay {
                                                Circle()
                                                    .stroke(selectedAnemity == "grocers" ? Color.blue : Color.clear,lineWidth:3)
                                            }
                                            .onTapGesture {
                                                selectedAnemity = "grocers"
                                                mapType = .hybrid
                                            }
                                        Text("Grocers")
                                            .font(.subheadline)
                                            .foregroundStyle(selectedAnemity == "grocers" ? Color.blue : Color.black)
                                    }
                                    VStack {
                                        Image(systemName:"mug.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(10)
                                            .background(Circle().fill(Color.gray.opacity(0.2)))
                                            .clipShape(Circle())
                                            .frame(width:40,height:40)
                                            .overlay {
                                                Circle()
                                                    .stroke(selectedAnemity == "coffee shops" ? Color.blue : Color.clear,lineWidth:3)
                                            }
                                            .onTapGesture {
                                                selectedAnemity = "coffee shops"
                                                mapType = .hybrid
                                            }
                                        Text("Coffee shops")
                                            .font(.subheadline)
                                            .foregroundStyle(selectedAnemity == "coffee shops" ? Color.blue : Color.black)
                                    }
                                    VStack {
                                        Image(systemName:"fuelpump")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(10)
                                            .background(Circle().fill(Color.gray.opacity(0.2)))
                                            .clipShape(Circle())
                                            .frame(width:40,height:40)
                                            .overlay {
                                                Circle()
                                                    .stroke(selectedAnemity == "gas" ? Color.blue : Color.clear,lineWidth:3)
                                            }
                                            .onTapGesture {
                                                selectedAnemity = "gas"
                                                mapType = .hybrid
                                            }
                                        Text("Gas")
                                            .font(.subheadline)
                                            .foregroundStyle(selectedAnemity == "gas" ? Color.blue : Color.black)
                                    }
                                }
                                .frame(maxWidth:.infinity,alignment:.leading)
                                .padding(.horizontal)
                            }
                        }
                        
                        .padding()
                        
                        
                    }
                    .padding(.vertical)
                    .presentationDetents([.medium,.large])
                    .presentationDragIndicator(.automatic)
                }
                
                .padding(7)
                .background(Color.white)
                .foregroundStyle(Color.black)
                .cornerRadius(20)
                .font(.system(size: 23))
                .shadow(radius: 13)
                Button(action: {}){
                    Image(systemName: "hand.draw")
                }
                .padding(7)
                .background(Color.white)
                .foregroundStyle(Color.black)
                .cornerRadius(20)
                .font(.system(size: 23))
                .shadow(radius: 13)
                Button(action: {}){
                    Image(systemName: "location")
                }
                .padding(7)
                .background(Color.white)
                .foregroundStyle(Color.black)
                .cornerRadius(20)
                .font(.system(size: 23))
                .shadow(radius: 13)
            }
            Spacer()
            Button(action:{
                presented = true
            }) {
                
                Label("Save Search",systemImage: "magnifyingglass")
                    .padding(10)
                    .background(Color.myBlue)
                    .foregroundStyle(.white)
                    .cornerRadius(15)
                    .bold()
                    .font(.system(size: 15))
                    .shadow(radius: 13)
            }
        }
    }
}

