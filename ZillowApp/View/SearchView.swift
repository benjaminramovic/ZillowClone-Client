//
//  SearchView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 1.12.24..
//

import SwiftUI
import MapKit

struct LocationItem:Identifiable {
    var id = UUID()
    var coordinate:CLLocationCoordinate2D
}

struct SearchView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 44.7866, longitude: 20.4489), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    @State private var showSheet2:Bool = false
    @State private var selectedImage:String = "map"
    @State private var selectedRisk:String = ""
    @State private var selectedAnemity:String = ""

    @State private var isOn:Bool = false
    
    @State private var mapType: MKMapType = .standard

    let markers = [
          Marker(location: CLLocationCoordinate2D(latitude: 44.8176, longitude:20.4569), price: "$499K"),
          Marker(location: CLLocationCoordinate2D(latitude: 45.7634, longitude: 30.4289), price: "$1.2M"),
      ]
    
    let climateRisks = ["Flood","Fire","Wind","Air","Heat"]
    let amenities:[String] = ["Banks","Coffee shops","Gas","Grocers"]
    let amenitiesIcons:[String] = ["dollarsign","mug.fill","fuelpump","cart",]

    
    let locations:[LocationItem] = [
        LocationItem(coordinate:CLLocationCoordinate2D(latitude: 44.8176, longitude: 20.4569)),
        LocationItem(coordinate:CLLocationCoordinate2D(latitude: 44.7634, longitude: 20.4289)),
        LocationItem(coordinate:CLLocationCoordinate2D(latitude: 44.7638, longitude: 20.4285))
    ]
    @State private var showSheet:Bool = true
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                    TextField("Home feature, school, location",text: .constant(""))
                        .padding(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray)
                        }
                    NavigationLink(destination:Filters()){
                        Image(systemName: "lines.measurement.horizontal")
                            .foregroundStyle(Color.myBlue)
                    }
                    
                    
                }
                .padding(.horizontal)
                Spacer()
                
                
                Map(coordinateRegion: $region, annotationItems: markers){ marker in
                    /*MapMarker(coordinate: location.coordinate, tint:.red)*/
                    MapAnnotation(coordinate: marker.location) {
                                   CustomMarker(marker: marker)
                               }
                    
                }
            
                .overlay {
                    HStack {
                        HStack{
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
                    Button(action:{}) {
                        
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
                .padding(.horizontal)
                .padding(.top,260)
            }
            
            
            
        }
        .overlay(alignment:.bottom) {
            
            SearchMapSheetContentView()
                .transition(.move(edge: .bottom))
        }
        .animation(.easeInOut)
    }
}
}


#Preview {
    SearchView()
}




