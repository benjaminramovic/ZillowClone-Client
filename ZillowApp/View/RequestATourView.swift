//
//  RequestATourView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 3.8.25..
//

import SwiftUI

struct RequestATourView: View {
     @State var times:[String] = [
        "Fri, Jul 25 at 11:00am",
        "",
        ""
    
    ]
    var body: some View {
        NavigationView{
            VStack {
                Image("est3").resizable().frame(width:.infinity,height: 200)
                HStack {
                    Image(systemName:"info.circle.fill")
                        .resizable()
                        .frame(width:22, height:22)
                        .foregroundStyle(Color.darkBlue)
                    Text("Go on a personalized tour of this home by connecting with a local buyer's agent.")
                }
                .padding()
                .frame(maxWidth:.infinity, alignment: .leading)
                .background(Color.skyBlue.opacity(0.5))

                .overlay (
                    RoundedRectangle(cornerRadius:3)
                        .stroke(Color.darkBlue, lineWidth:1.5)
                        
                        
                )
                .padding(.top, 20)
                
                Text("Tour with a buyer's agent")
                    .bold()
                    .font(.title2)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.vertical,5)
                Text("We'll find a local expert to take you on a private tour of 622 24th St.")
                    .frame(maxWidth:.infinity, alignment: .leading)
                Text("Learn more about touring with Zillow")
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.vertical)
                    .bold()
                    .foregroundStyle(Color.darkBlue)
                Divider()
                Text("Select up to 3 times")
                    .bold()
                    .font(.title3)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.vertical,10)
                
                ForEach(times.indices, id:\.self) { index in
                    var item = times[index]
                    if !item.isEmpty {
                        HStack {
                            Image(systemName:"clock")
                                .resizable()
                                .frame(width:30, height:30)
                                .foregroundStyle(Color.black.opacity(0.5))
                            Text(item)
                            Spacer()
                            Image(systemName:"xmark.circle.fill")
                                .resizable()
                                .frame(width:15, height:15)
                                .foregroundStyle(Color.black)
                                .onTapGesture {
                                    
                                    if let ind = times.firstIndex(of:item) {
                                        times[ind] = ""
                                    }
                                }
                            
                        }
                        .padding(.vertical,7)
                        Divider()
                    } else {
                         HStack {
                         Image(systemName:"plus.circle")
                         .resizable()
                         .frame(width:30, height:30)
                         
                         Text("Select a time (optional)")
                         
                         Spacer()
                         }
                         .padding(.vertical,7)
                         .foregroundStyle(Color.darkBlue)
                         .onTapGesture {
                             times[index] = "Aaa"
                         }
                 
                        Divider()
                    }
              
                        
                    
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .font(Font.custom("AvenirLTStd-Medium", size: 18))
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Image(systemName:"xmark")
                        .resizable()
                        .frame(width:25, height: 25)
                        .onTapGesture {
                            //dismiss()
                        }
                }
                ToolbarItem(placement: .principal){
                    Text("Request a tour")
                        .font(Font.custom("AvenirLTStd-Black", size: 22))
                 
                }
                ToolbarItem(placement: .bottomBar){
                    Button(action:{
                       
                    }){
                        Text("Next")
                            .padding(5)
                            .frame(maxWidth:.infinity, alignment:.center)
                            .bold()
                            .font(.title3)
                        
                            
                    }
                    .foregroundStyle(Color.white)
                    .background(Color.myBlue)
                   
                }
            }
        }
    }
}

#Preview {
    RequestATourView()
}
