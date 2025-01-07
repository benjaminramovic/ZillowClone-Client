import SwiftUI

struct Carousel: View {
    @State private var estatesDemo: [EstateDemo] = [
        EstateDemo(id: 1, color: .blue, visited: false),
        EstateDemo(id: 2, color: .red, visited: false),
        EstateDemo(id: 3, color: .green, visited: false)
    ]
    
    @State private var selected: Int = 1 // Initial selection
    
    var body: some View {
        EmptyView()
        /*VStack {
            // HStack for selecting items
            HStack {
                ForEach(estatesDemo.indices, id: \.self) { index in
                    let demo = estatesDemo[index]
                    Text(String(demo.id))
                        .padding(15)
                        .background(demo.visited ? Color.red.opacity(0.5) : Color.blue.opacity(0.5))
                        .cornerRadius(8)
                        .overlay {
                            Rectangle()
                                .stroke(selected == demo.id ? Color.yellow : Color.black, lineWidth: 2)
                        }
                        .onTapGesture {
                            selected = demo.id
                            estatesDemo[index].visited = true
                        }
                }
            }
            .padding(.bottom, 20)
            
            // Paging ScrollView using TabView
            TabView(selection: $selected) {
                ForEach(estatesDemo.indices, id: \.self) { index in
                    let demo = estatesDemo[index]
                    EstateCard()
                        .tag(demo.id) // Tag to track selected item
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Snap to page style
            .frame(height: 400) // Set fixed height for TabView
        }
        .padding()
         */
    }
}


#Preview {
    Carousel()
}
