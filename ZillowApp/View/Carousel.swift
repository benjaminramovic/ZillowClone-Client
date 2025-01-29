import SwiftUI


struct Carousel: View {
    @Binding var estates : [EstateMain]
    @Binding var selected: Int // Initial selection
    
    var body: some View {
         
           /* HStack {
                ForEach(estatesDemo) { demo in
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
                            if let index = estatesDemo.firstIndex(where: { $0.id == demo.id }) {
                                estatesDemo[index].visited = true
                            }
                        }
                }
            }
            .padding(.bottom, 20)*/
           
            
        TabView(selection: $selected) {
                ForEach(estates) { demo in
                    EstateCard(estate: demo)
                        .tag(demo.id)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 400)
            .onAppear {
                estates[selected].description = "visited"
            }
          

       
    }
}



