import SwiftUI
import BottomSheet

struct ContentView: View {
    var body: some View {
            // Pozadina postavljena na belu za ceo ekran
            
            TabView {
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                            .background(Color.white)
                    }
                    .background(Color.white)
                SavedSearchesView()
                    .tabItem {
                        Label("Updates", systemImage: "heart.text.square")
                    }
                SavedHomesView()
                    .tabItem {
                        Label("Saved Homes", systemImage: "heart.fill")
                    }
                HomeLoansView()
                    .tabItem {
                        Label("Home Loans", systemImage: "dollarsign.circle")
                    }
                InboxView()
                    .tabItem {
                        Label("Inbox", systemImage: "tray")
                    }
              
            }
            
        
    }
}

#Preview {
    ContentView()
        .environmentObject(LocationManager())
}
