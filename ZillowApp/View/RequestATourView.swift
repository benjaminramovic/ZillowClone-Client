//
//  RequestATourView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 3.8.25..
//

import SwiftUI

struct RequestATourView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("")
            }
            .padding(.horizontal)
            
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
