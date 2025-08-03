//
//  PropertyComparisonView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 3.8.25..
//

import SwiftUI

struct PropertyComparisonView: View {
    let tabs = ["Overview", "Interior", "Property", "HOA & Financial", "Community & Ne"]
    @State private var selectedTab = "Overview"
    
    let headers = ["Status", "List Price", "Zestimate", "Estimated monthly cost", "Price/sqft", "Bedrooms", "Bathrooms", "Square feet"]
    
    let property1 = ["For Sale", "988.000 US$", "991.600 US$", "5.236 $", "673 US$", "3", "2", "1,468 sqft"]
    let property2 = ["New construction", "320.900 US$+", "—", "1.746 $", "154 US$", "4", "3", "2,086 sqft"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    
                    // Tabs
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(tabs, id: \.self) { tab in
                                Text(tab)
                                    .fontWeight(tab == selectedTab ? .bold : .regular)
                                    .foregroundColor(tab == selectedTab ? .blue : .primary)
                                    .onTapGesture {
                                        selectedTab = tab
                                    }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Divider()
                    
                    // Images + Titles
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Image("estate1") // Replace with actual image name
                                .resizable()
                                .frame(width: 160, height: 120)
                                .cornerRadius(8)
                            Text("315 De Long St\nSan Francisco, CA 941...")
                                .font(.subheadline)
                                .lineLimit(2)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Image("estate3") // Replace with actual image name
                                .resizable()
                                .frame(width: 160, height: 120)
                                .cornerRadius(8)
                            Text("Campo Del Sol\nEl Paso, TX 79934")
                                .font(.subheadline)
                                .lineLimit(2)
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    // Tags buttons
                    HStack {
                        Button("+ Add tags") { }
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                        
                        Button("Bedrooms") { }
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    // Table rows
                    ForEach(headers.indices, id: \.self) { index in
                        HStack {
                            Text(headers[index])
                                .font(.subheadline)
                                .frame(width: 160, alignment: .leading)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text(property1[index])
                                .frame(width: 90, alignment: .center)
                            
                            Text(property2[index])
                                .frame(width: 90, alignment: .center)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        Divider()
                    }
                    
                    // Bottom section - Interior
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Interior")
                            .font(.headline)
                            .padding(.top)
                        HStack {
                            Text("Home type")
                                .fontWeight(.semibold)
                                .frame(width: 160, alignment: .leading)
                            Spacer()
                            Text("SingleFamily")
                                .frame(width: 90, alignment: .center)
                            Text("SingleFamily")
                                .frame(width: 90, alignment: .center)
                        }
                        .padding(.horizontal)
                        Divider()
                    }
                }
                .padding(.top)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Image(systemName: "pencil")
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

struct PropertyComparisonView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyComparisonView()
    }
}
