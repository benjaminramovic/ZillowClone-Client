import SwiftUI
import BottomSheet

struct ContentView: View {
    @State private var err:String = ""
    @EnvironmentObject var vm: AuthenticationView

    var body: some View {
            // Pozadina postavljena na belu za ceo ekran
        Button{
            Task{
                do{
                    try await AuthenticationView().logout()
                } catch let e {
                    
                    err = e.localizedDescription
                }
            }
            } label: {
                Text("Log Out").padding(8)
            }.buttonStyle(.borderedProminent)
        Text(String(vm.uid ?? 0))

            
            Text(err).foregroundColor(.red).font(.caption)
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
        .environmentObject(AuthenticationView())
}
