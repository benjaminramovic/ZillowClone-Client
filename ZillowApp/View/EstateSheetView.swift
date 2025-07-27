//
//  EstateSheetView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 30.1.25..
//

import SwiftUI

struct EstateSheetView: View {
    let special = [
        "Finished basement",
        "Flexible space",
        "Luxurious primary suite",
        "Exposed brick",
        "Decorative tile splash"
    ]
    var body: some View {
       
        VStack {
            ScrollView {
            Text("$250,000")
                .font(Font.custom("AvenirLTStd-Black", size: 40))
            
                .frame(maxWidth:.infinity, alignment: .leading)
            HStack {
                Image(systemName:"sofa.fill")
                    .foregroundStyle(Color.gray)
                Text("3 beds")
                Image(systemName:"bathtub.fill")
                    .foregroundStyle(Color.gray)
                Text("3 baths")
                Image(systemName:"triangle.fill")
                    .foregroundStyle(Color.gray)
                Text("984 sqft")
                Spacer()
                
            }
            
            .padding(.top,4)
            .padding(.bottom,2)
            
            .font(Font.custom("AvenirLTStd-Medium", size: 18))
            
            Text("1756 N Taney St, Philadelphia, PA 19121")
                .frame(maxWidth:.infinity,alignment:.leading)
                .font(Font.custom("AvenirLTStd-Medium", size: 18))
            
            HStack {
                Text("Est.")
                    .font(Font.custom("AvenirLTStd-Black", size: 17))
                    .foregroundStyle(Color.darkBlue)
                Text("1.506 US$/mo")
                    .font(Font.custom("AvenirLTStd-Black", size: 17))
                Spacer()
                Text("Can you afford this?")
                    .font(Font.custom("AvenirLTStd-Black", size: 17))
                    .foregroundStyle(Color.darkBlue)
            }
            .padding()
            .background(Color.skyBlue)
            .cornerRadius(15)
            
            VStack {
                Text("Facts & features")
                    .font(Font.custom("AvenirLTStd-Black", size: 23))
                    .frame(maxWidth:.infinity,alignment:.leading)
                    .padding()
                VStack {
                    HStack {
                        HStack {
                            HStack {
                                Image(systemName: "z.square.fill")
                                Text("243.100 US$")
                            }
                        }
                        
                        Spacer()
                        HStack {
                            HStack {
                                Image(systemName: "building.2")
                                Text("Townhouse")
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    HStack {
                        HStack {
                            HStack {
                                Image(systemName: "ruler")
                                Text("254 US$/sqft")
                            }
                        }
                        Spacer()
                        HStack {
                            HStack {
                                Image(systemName: "hammer")
                                Text("Built in 1915")
                            }
                        }
                    }
                    .padding(.vertical)
                    
                    HStack {
                        HStack {
                            HStack {
                                Image(systemName: "homekit")
                                Text("$-- HOA")
                            }
                        }
                        
                        Spacer()
                        HStack {
                            HStack {
                                Image(systemName: "sprinkler")
                                Text("776 sqft lot")
                            }
                        }
                    }
                    .padding(.vertical)
                   
                    HStack {
                        Text("Show more")
                        Image(systemName:"chevron.right")
                        Spacer()
                    }
                    .padding(.top)
                    .font(Font.custom("AvenirLTStd-Black", size: 19))
                    .foregroundStyle(Color.darkBlue)
                    
                    
                    
                }
                .padding()
                .font(Font.custom("AvenirLTStd-Medium", size: 18))
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.vertical)
            .font(Font.custom("AvenirLTStd-Medium", size: 18))
            
            VStack {
                Text("What's special")
                    .font(Font.custom("AvenirLTStd-Black", size: 23))
                    .frame(maxWidth:.infinity,alignment:.leading)
                    .padding()
                VStack {
                 
                    VStack {
                        HStack {
                            Text(special[0])
                                .padding(3)
                                .background(Color.gray.opacity(0.13))
                            Text(special[1])
                                .padding(3)
                                .background(Color.gray.opacity(0.13))
                        }
                        .frame(maxWidth:.infinity,alignment:.leading)
                        HStack {
                            Text(special[2])
                                .padding(3)
                                .background(Color.gray.opacity(0.13))
                            Text(special[3])
                                .padding(3)
                                .background(Color.gray.opacity(0.13))
                        }
                        .frame(maxWidth:.infinity,alignment:.leading)
                        HStack {
                            Text(special[4])
                                .padding(3)
                                .background(Color.gray.opacity(0.13))
                            Text("+2 more")
                                .padding(3)
                                .background(Color.gray.opacity(0.13))
                        }
                        .frame(maxWidth:.infinity,alignment:.leading)
                    }
                    
                    .textCase(.uppercase)
                    .font(Font.custom("AvenirLTStd-Black", size: 14))
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
                        .font(Font.custom("AvenirLTStd-Medium", size: 19))
                        .padding(.top)
                    
              
                    
        
                    HStack {
                        Text("Show more")
                        Image(systemName:"chevron.down")
                        Spacer()
                    }
                    .padding(.top)
                    .font(Font.custom("AvenirLTStd-Black", size: 19))
                    .foregroundStyle(Color.darkBlue)
                    
                    
                    
                }
                .padding()
                
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.vertical)
            .font(Font.custom("AvenirLTStd-Medium", size: 18))
            
            HStack {
                Text("26 days")
                    .font(Font.custom("AvenirLTStd-Black", size: 17))
                Text("on Zillow")
                Spacer()
                Text("917")
                    .font(Font.custom("AvenirLTStd-Black", size: 17))
                Text("views")
                Spacer()
                Text("83")
                    .font(Font.custom("AvenirLTStd-Black", size: 17))
                Text("saves")
                
                }
            .font(Font.custom("AvenirLTStd-Medium", size: 17))
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 1)
            .padding(.bottom,70)
            
            
            
            
            
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .padding()
        .padding(.vertical)
        .overlay {
            VStack {
                Spacer()
                HStack {
                    Button(action:{}){
                        Text("Contact")
                    }
                    .frame(maxWidth:80,
                           maxHeight:40)
                    .padding(10)
                    .font(Font.custom("AvenirLTStd-Black", size: 18))
                    
                    
                    .overlay {
                        Rectangle()
                            .stroke(Color.myBlue)
                        
                    }
                    Button(action:{}){
                        VStack {
                            Text("Request a tour")
                            Text("As early as today at 11:00 a.m")
                                .font(Font.custom("AvenirLTStd-Medium", size: 15))
                        }
                        
                    }
                    .frame(maxWidth:.infinity,maxHeight:40)
                    .padding(10)
                    .font(Font.custom("AvenirLTStd-Black", size: 18))
                    .background(Color.myBlue)
                    .foregroundStyle(Color.white)
                    
                    
                    
                }
                
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: -1)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray.opacity(0.5)),
                    alignment: .top
                )
                
            }
            
            
        }
    }
    }
}

#Preview {
    EstateSheetView()
}
