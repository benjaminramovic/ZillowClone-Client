//
//  DoubleRange.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 11.12.24..
//

import SwiftUI

struct DoubleRange: View {
    /*@State var width:CGFloat = 0
    @State var widthTow:CGFloat = 15
    let offsetValue:CGFloat = 40
    @State var totalScreen:CGFloat = 0
    let maxValue:CGFloat = 1000
    @State var isDraggingLeft = false
    @State var isDraggingRight = false
    */
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

       var body: some View {
         
            
               
               ZStack {
                   // Traka
                   Rectangle()
                       .frame(width: trackWidth, height: trackHeight)
                       .foregroundColor(.myBlue)
                       .cornerRadius(trackHeight / 2)

                   // Prikaz trenutnih klizača
                   Circle()
                       .fill(.white)
                       .frame(width: 30, height: 30)
                       .shadow(radius: 3)
                       .overlay(
                        Circle().stroke(Color.black,lineWidth: 0.2)
                       )
                
                       
                       .position(x: lowerThumbX + 10, y: trackHeight+370)
                       .gesture(DragGesture()
                           .onChanged { value in
                               let newValue = Double(value.location.x / trackWidth) * (maxValue - minValue)
                               if newValue >= minValue && newValue <= upperValue-14 {
                                   lowerValue = newValue
                               }
                           }
                       )

                   Circle()
                       .fill(.white)
                       .frame(width: 30, height: 30)
                       .shadow(radius: 3)
                       .overlay(
                        Circle().stroke(Color.black,lineWidth: 0.2)
                       )
                       .position(x: upperThumbX - 15, y: trackHeight + 370)
                       .gesture(DragGesture()
                           .onChanged { value in
                               let newValue = Double(value.location.x / trackWidth) * (maxValue - minValue)
                               if newValue >= lowerValue+15 && newValue <= maxValue+15 {
                                   upperValue = newValue
                               }
                           }
                       )
               }
               .padding(.horizontal, 100)

            
               .padding()
           }
       }


#Preview {
    DoubleRange()
}
