import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct ContentView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
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
}