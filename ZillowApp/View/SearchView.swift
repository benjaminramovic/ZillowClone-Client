//
//  SearchView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 1.12.24..
//

import SwiftUI
import MapKit
import BottomSheet

struct LocationItem:Identifiable {
    var id = UUID()
    var coordinate:CLLocationCoordinate2D
}
struct SearchView: View {
    @State var bottomSheetPosition : BottomSheetPosition = .relative(0.2)
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 44.7266, longitude: 20.4389), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
    )
    @State private var showSheet2:Bool = false
    @State private var selectedImage:String = "map"
    @State private var selectedRisk:String = ""
    @State private var selectedAnemity:String = ""

    @State private var isOn:Bool = false
    
    @State private var mapType: MKMapType = .standard
    @State private var isVisible2:Bool = false
    @State var current:Int = 0
    @State private var isOnEmail:Bool = false
    @State private var resultsText: String = "No matching results"
    


    @State private var isNavigatingToSearch = false
    @State private var isNavigatingToUpdates = false
    @State private var isNavigatingToSavedHomes = false
    @State private var isNavigatingToHomeLoans = false
    @State private var isNavigatingToInbox = false
    
    @State private var expanded: Bool = false // Da kontrolišemo da li je div proširen
    @State private var expandedHeight: CGFloat = 100 // Početna visina (može biti manja)
    @State private var minHeight: CGFloat = 50 // Minimalna visina div-a


    @State private var searchName = "For sale near 90403"

    
    let markers = [
          Marker(location: CLLocationCoordinate2D(latitude: 44.8176, longitude:20.4569), price: "$499K"),
          Marker(location: CLLocationCoordinate2D(latitude: 45.7634, longitude: 30.4289), price: "$1.2M"),
      ]
    
    let climateRisks = ["Flood","Fire","Wind","Air","Heat"]
    let amenities:[String] = ["Banks","Coffee shops","Gas","Grocers"]
    let amenitiesIcons:[String] = ["dollarsign","mug.fill","fuelpump","cart",]
    
    @State private var cuurent:Int = 0

    @StateObject var viewModel = EstateViewModel()
    
    @State private var screenHeight: CGFloat = UIScreen.main.bounds.height

    @State private var showSheet:Bool = true
    @State private var isPresented:Bool = true
    @State private var demo = 0
    @State private var bp = 0
    @State var visited:[Int] = []
    @State var mapOption = 1
    @State private var cameraPosition = MapCameraPosition.region(
           MKCoordinateRegion(
               center: CLLocationCoordinate2D(latitude: 44.7866, longitude: 20.4489),
               span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
           )
       )
    @State private var presented:Bool = false
    @EnvironmentObject var locationManager:LocationManager

    @EnvironmentObject var auth:AuthenticationView
    var body: some View {
        NavigationStack {
            VStack {
                SearchBarView()
                    .padding(.top,2)
                Spacer()
                
                
                Map(coordinateRegion: $region, annotationItems: viewModel.estates){ estate in
                    /*MapMarker(coordinate: location.coordinate, tint:.red)*/
                    MapAnnotation(coordinate: CLLocationCoordinate2DMake(estate.latitude, estate.longitude)) {
                        CustomMarker(marker: estate, current: $current, isVisible: $isVisible2,visited: $visited)
                            .onTapGesture {
                                current = estate.id
                            }
                    }
                }
                .mapStyle(mapOption==1 ? .standard : (mapOption==2 ? .imagery : .hybrid(elevation:.realistic)))
                .onAppear {
                    print("Mapa je učitana sa regionom: \(region.center.latitude), \(region.center.longitude)")
                }
                .onTapGesture {
                    if isVisible2==true {
                        isVisible2 = false
                        if current > 0 {current = 0}
                    }
                }
            
                .overlay {
                    if isVisible2 {
                        
                        Carousel(estates: $viewModel.estates,selected:$current)
                            .padding(.top,200)
                    }
                    
                    else {
                            Spacer()
                        MapOptionsLineView(presented:$presented, region: $region, option: $mapOption)
                                .padding(.horizontal)
                                .padding(.top,470)
                            
                               .bottomSheet(bottomSheetPosition: self.$bottomSheetPosition, switchablePositions: [.relative(0.2),.relative(0.4),.relativeTop(1)]){
                                    ZStack {
                                        
                                        VStack {
                                            Text("\(viewModel.estates.count) found").bold().padding()
                                            Text(String(auth.uid ?? 0))
                                            ScrollView {
                                                VStack(spacing: 10) { // Dodajte razmak između kartica za bolju vidljivost
                                                    ForEach(viewModel.estates) { estate in
                                                        NavigationLink(destination:EstateView(estate: estate)){
                                                            EstateCard(estate: estate)
                                                                .frame(maxWidth: .infinity) // Osigurajte da kartica zauzima maksimalnu širinu
                                                        }
                                                        .foregroundStyle(Color.black)
                                                        
                                                    }
                                                }
                                            }
                                            .frame(maxHeight: UIScreen.main.bounds.height)
                                            
                                        }
                                        if bottomSheetPosition == .relativeTop(1) {
                                            
                                            Button(action:{
                                                withAnimation {
                                                    bottomSheetPosition = .relative(0.2)
                                                }
                                            }) {
                                                Image(systemName: "map")
                                                Text("Map")
                                            }
                                            .bold()
                                            .padding(15)
                                            .foregroundStyle(Color.white)
                                            .background(Color.darkBlue)
                                            .cornerRadius(22)
                                            .shadow(radius: 10)
                                            .transition(.opacity)
                                            .padding(.top, UIScreen.main.bounds.height - 360) // Visina ekrana minus 80
                                            
                                            
                                            
                                        }
                                        
                                    }
                                    
                                    

                                }
                               
//
                                }
                        
                    }
            }
            .onChange(of: locationManager.location){newValue in
                viewModel.getAllEstates2(place: newValue)
            }
            .sheet(isPresented: $presented){
                VStack {
                    HStack {
                        Text("Save search")
                            .font(Font.custom("AvenirLTStd-Black", size: 23)).bold()
                        Spacer()
                        Image(systemName: "x.circle.fill").foregroundStyle(Color.gray)
                    }
                    .padding(.vertical,7)
                    Divider()
                    Text("Get push and email notifications when new homes go on the market.")
                        .font(Font.custom("AvenirLTStd-Medium", size: 19)).bold()
                        .foregroundStyle(Color.black.opacity(0.7))
                        .frame(alignment: .leading)
                        .padding(.vertical)
                        .lineLimit(nil)  // Omogućava neograničen broj redova
                                    .fixedSize(horizontal: false, vertical: true) // Sprečava skraćivanje teksta
                    
                    Text("Name your search")
                        .font(Font.custom("AvenirLTStd-Black", size: 19)).bold()
                        .frame(maxWidth:.infinity, alignment: .leading)
                    TextField("",text:$searchName)
                        .padding(8)
                        .font(Font.custom("AvenirLTStd-Medium", size: 19))
                        .foregroundStyle(Color.black.opacity(0.7))
                    
                   

                
             
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black.opacity(0.7))
                }
                    Toggle("Email notifications",isOn: $isOnEmail)
                        .padding(.vertical)
                        .font(Font.custom("AvenirLTStd-Black", size: 19))
                    
                    Button(action:{}){
                        Text("Save search")
                            .padding(.vertical,13)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.myBlue)
                    .foregroundStyle(Color.white)
                    .bold()
                    .font(Font.custom("AvenirLTStd-Black", size: 19))
                    

                    Spacer()
                    
                }
                .padding()
                .presentationDetents([.height(350)])
                
                
                
            }
            
            
            
        }
          
            /*.sheet(isPresented: $isPresented) {
                    VStack {
                        Spacer()
                HStack {
                            TabBarItem(title: "Search", systemImage: "magnifyingglass", index: 0)
                                
                            Spacer()
                            TabBarItem(title: "Updates", systemImage: "heart.text.square", index: 1)
                            Spacer()
                                              TabBarItem(title: "Saved Homes", systemImage: "heart.fill", index: 2)
                                                  .onTapGesture {
                                                      demo = 3
                                                  }
                                          
                            Spacer()
                            TabBarItem(title: "Home Loans", systemImage: "dollarsign.circle",index:3)
                            Spacer()
                            TabBarItem(title: "Inbox", systemImage: "tray",index:4)
                        }
                        .padding()
                        .cornerRadius(20)
                        .shadow(radius: 5)
                    }
                
                .presentationDragIndicator(.visible) // Prikazuje indikator za povlačenje
                .presentationDetents([.height(200)]) // Određuje visinu sheet-a
            }*/

            
            /*.overlay(alignment:.bottom) {
                if viewModel.estates.count > 0 {
                    if isVisible2==true {
                        SearchMapSheetContentView(minHeight: 80,text: $resultsText,estates: viewModel.estates)
                        .transition(.move(edge: .bottom))
                        .onAppear {
                            
                            resultsText = "\(viewModel.estates.count) results"
                            
                            
                        }
                }
                else {
                    SearchMapSheetContentView(minHeight: 80, text:$resultsText,maxHeight:screenHeight,estates: viewModel.estates)
                        .transition(.move(edge: .bottom))
                        .onAppear {
                            resultsText = "\(viewModel.estates.count) results"
                        }
                    
                }
            }
        }*/
        .onAppear {
            viewModel.getAllEstates2(place: locationManager.location)
        }
        
    }
}



#Preview {
    SearchView()
        .environmentObject(LocationManager())
        .environmentObject(AuthenticationView())
}

struct TabBarItem: View {
    let title: String
    let systemImage: String
    let index: Int
    
    var body: some View {
            VStack {
                Image(systemName: systemImage)
                    .font(.system(size: 24))
                    .foregroundColor(.gray)
                
                Text(title)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        
        }
        
        
    
}
