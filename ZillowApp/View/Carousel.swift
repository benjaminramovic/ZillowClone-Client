import SwiftUI

struct Carousel: View {
    @State private var estatesDemo: [EstateDemo] = [
        EstateDemo(id: 1, color: .blue, visited: false),
        EstateDemo(id: 2, color: .red, visited: false),
        EstateDemo(id: 3, color: .green, visited: false)
    ]
    
    @State private var selected: Int = 1 // Initial selection
    
    var body: some View {
        VStack {
            // HStack for selecting items
            HStack {
                ForEach($estatesDemo) { $demo in
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
                            demo.visited = true
                        }
                }
            }
            .padding(.bottom, 20)
            
            // Paging ScrollView using TabView
            TabView(selection: $selected) {
                ForEach($estatesDemo) { $demo in
                    EstateCard()
                   /* RoundedRectangle(cornerRadius: 20)
                        .fill(demo.color)
                        .shadow(radius: 5, x: 5, y: 5)
                        .frame(width: UIScreen.main.bounds.width - 100, height: 400)
                        .tag(demo.id)*/ // Tag to track selected item
                        /*.onAppear {
                            if selected == demo.id {
                                demo.visited = true
                            }
                        }*/
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Snap to page style
            .frame(height: 400) // Set fixed height for TabView
        }
        .padding()
      
    }
}



#Preview {
    Carousel()
}
