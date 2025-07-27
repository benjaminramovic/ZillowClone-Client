import Foundation
import Combine

class EstateViewModel: ObservableObject {
    @Published var estates: [EstateMain] = []
    @Published var locations: [String] = []
    @Published var savedEstates: [EstateMain] = []
    private var cancellables = Set<AnyCancellable>()
    var baseUrl = "http://localhost:8080/api/estates"
    
    @Published var saveSuccess = false
    @Published var unsaveSuccess = false
    @Published var errorMessage: String? = nil
    
    private let service = EstateService()
    
    
    func getAllEstates2(place: String) {
        guard let url = URL(string: baseUrl + "/getByPlace") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: String] = ["place": place]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                print("📦 Raw JSON response: \(String(data: data, encoding: .utf8) ?? "Invalid data")")
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let estates = try decoder.decode([EstateMain].self, from: data)
                
                DispatchQueue.main.async {
                    self.estates = estates
                    print("✅ Decoded estates: \(estates)")
                }
            } catch {
                print("❌ Error: \(error)")
            }
        }
    }

    /*func getAllEstates() {
            guard let url = URL(string: baseUrl) else {
                print("Invalid URL")
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .handleEvents(receiveOutput: { data in
                    print("Raw JSON response: \(String(data: data, encoding: .utf8) ?? "Invalid data")")
                })
                .decode(type: [EstateMain].self, decoder: decoder)
                .replaceError(with: [])
                .receive(on: DispatchQueue.main)
                .sink { [weak self] estates in
                    self?.estates = estates
                    print("///////////////////////////Decoded estates: \(estates)")
                }
                .store(in: &cancellables)
        }*/
    
    func loadLocations(){
        service.getAllLocations{ [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case.success(let locations):
                    self?.locations = locations
                    print(locations)
                case.failure(let error):
                    print("Error in retreiving locations...")
                }
            }
        }
    }
    
    func getSavedEstates(uid:Int) {
        service.getSavedEstates(userId:uid){ [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case.success(let estates):
                    self?.savedEstates = estates
                    print("SAved estates od user with id: \(uid): \(estates)")
                case.failure(let error):
                    print("Error in retreiving saved estates...")
                    print(error)
                }
            }
        }
    }
    
    func saveEstate(userId: Int, estateId: Int){
        service.saveEstate(userId: userId, estateId: estateId) { result in
            DispatchQueue.main.async {
                        switch result {
                        case .success():
                            self.saveSuccess = true
                            self.errorMessage = nil
                        case .failure(let error):
                            self.saveSuccess = false
                            self.errorMessage = error.localizedDescription
                        }
                    }
                }
    }
    
    func unsaveEstate(userId: Int, estateId: Int){
        service.unsaveEstate(userId: userId, estateId: estateId) { result in
            DispatchQueue.main.async {
                        switch result {
                        case .success():
                            self.unsaveSuccess = true
                            self.errorMessage = nil
                        case .failure(let error):
                            self.saveSuccess = false
                            self.errorMessage = error.localizedDescription
                        }
                    }
                }
    }
    
    
    
}
