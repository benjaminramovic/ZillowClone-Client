//
//  SearchMapSheetContentView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 2.12.24..
//

import SwiftUI

struct SearchMapSheetContentView: View {
    let minHeight: CGFloat = 180
        let maxHeight: CGFloat = 450
        @State private var extraHeight = CGFloat.zero
        @State private var dragHeight = CGFloat.zero

        var body: some View {
            VStack {
                Text("No matching results")
                    .font(.headline)
                    .bold()
                Text("Try searching in a larger area or changing filters.")
                    .foregroundStyle(.gray)
                // Add more content here as needed
            }
            .frame(maxWidth: .infinity, maxHeight: minHeight + extraHeight)
            .offset(y: -dragHeight / 2)
            .background {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, topTrailing: 20))
                    .padding(.bottom, -300)
                    .foregroundStyle(.white)
                    .offset(y: -dragHeight)
            }
            .overlay(alignment: .top) {
                Capsule()
                    .frame(width: 36, height: 5)
                    .foregroundStyle(.secondary)
                    .padding(5)
                    .offset(y: -dragHeight)
                    .gesture(
                        DragGesture()
                            .onChanged { val in
                                let dy = -val.translation.height
                                let minDragHeight = minHeight - (minHeight + extraHeight)
                                let maxDragHeight = maxHeight - (minHeight + extraHeight)
                                dragHeight = min(max(dy, minDragHeight), maxDragHeight)
                            }
                            .onEnded { val in
                                extraHeight = extraHeight + dragHeight
                                dragHeight = 0
                            }
                    )
            }
        }
    }


#Preview {
    SearchMapSheetContentView()
}
