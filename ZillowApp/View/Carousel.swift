import SwiftUI

struct Carousel: View {
    @Binding var estates: [EstateMain]
    @Binding var selected: Int

    var body: some View {
        TabView(selection: $selected) {
            ForEach(estates) { estate in
                EstateCard(estate: estate)
                    .frame(width: UIScreen.main.bounds.width * 0.85, height: 380)
                    .cornerRadius(20)
                    .padding(.horizontal, 10)
                    .scaleEffect(estate.id == selected ? 1.0 : 0.9) // istakni selektovanu
                    .animation(.easeInOut(duration: 0.3), value: selected)
                    .tag(estate.id)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 400)
        .padding(.horizontal, 20) // ovo omogućava da kartice "vire"
    }
}
