import Foundation
import Combine

class EstateViewModel: ObservableObject {
    @Published var estates: [EstateMain] = []
    private var cancellables = Set<AnyCancellable>()
    
    func getAllEstates() {
        guard let url = URL(string: "http://localhost:8080") else { return }
        
        // Kreiraj JSONDecoder
        let decoder = JSONDecoder()
        
        // Postavi DateFormatter za dekodiranje datuma
        /*let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        decoder.dateDecodingStrategy = .formatted(formatter)*/
        
        // Preuzmi podatke i dekodiraj ih
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [EstateMain].self, decoder: decoder) // Koristi dekoder sa formatiranim datumima
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink { [weak self] estates in
                self?.estates = estates
            }
            .store(in: &cancellables)
    }
}
