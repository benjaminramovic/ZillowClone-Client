import SwiftUI
import Firebase
import GoogleSignIn
import UIKit
import FirebaseAuth

class AuthenticationView: ObservableObject {
    
    @Published var isLoginSuccessed = false
    @Published var registeredUser: User? = User(id: 1, firstName: "B", lastName: "R", email: "E", phone: "P")
    @Published var uid:Int? = 0
    
    @EnvironmentObject var locationManager: LocationManager

    func signInWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: Application_utility.rootViewController) { user, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard
                let user = user?.user,
                let idToken = user.idToken else { return }
            
            let accessToken = user.accessToken
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { res, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                if let user = Auth.auth().currentUser {
                    let fname = user.displayName?.split(separator: " ").first.map(String.init) ?? ""
                    let lname = user.displayName?.split(separator: " ").dropFirst().joined(separator: " ") ?? ""
                    let email = user.email ?? ""
                    let phone = "06" + String(Int.random(in: 1000000..<9999999)) // test phone
                    
                    print("First name: \(fname)")
                    print("Last name: \(lname)")
                    print("Email: \(email)")
                    print("Phone: \(phone)")
                    
                    self.isLoginSuccessed = true
                    self.register(firstName: fname, lastName: lname, email: email, phone: phone)
                }
            }
        }
    }
    
    // ✅ Funkcija pomerena van druge funkcije
    func register(firstName: String, lastName: String, email: String, phone: String) {
        guard let url = URL(string: "http://localhost:8080/api/users") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "phone": phone
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending user: \(error.localizedDescription)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            print("ODGOVOR: \(httpResponse)")

            if let data = data, (200...299).contains(httpResponse.statusCode) {
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    DispatchQueue.main.async {
                        //self.locationManager.userId = user.id
                        
                        print("✅ User successfully registered: \(user)")
                        self.isLoginSuccessed = true
                        self.registeredUser = user
                        self.uid = self.registeredUser?.id

                        print(self.registeredUser)
                    }
                } catch {
                    print("Failed to decode user: \(error.localizedDescription)")
                }
            } else {
                DispatchQueue.main.async {
                    switch httpResponse.statusCode {
                    case 409:
                        print("ℹ️ User already exists.")
                    default:
                        print("⚠️ Unexpected response code: \(httpResponse.statusCode)")
                    }
                }
            }
        }.resume()
    }

    func logout() async throws {
        print("AAAA")
        GIDSignIn.sharedInstance.signOut()
        try Auth.auth().signOut()
    }
}
