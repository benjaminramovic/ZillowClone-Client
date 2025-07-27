//
//  EstateService.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 12.1.25..
//

import Foundation

class EstateService {
    var baseUrl = "http://localhost:8080/api/estates"
    var baseUrl2 = "http://localhost:8080/api/users"

    var estates:[EstateMain] = []
    
    func getAllLocations(completion: @escaping(Result<[String],Error>)->Void) {
        guard let url = URL(string: baseUrl + "/locations") else {
            print("Invalid URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }
            do {
                let decoded = try JSONDecoder().decode([String].self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getSavedEstates(userId: Int, completion: @escaping (Result<[EstateMain], Error>) -> Void) {
        guard let url = URL(string: baseUrl2 + "/savedEstates/" + String(userId)) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }

            do {
                let estates = try decoder.decode([EstateMain].self, from: data)
                DispatchQueue.main.async {
                    print("Decoded saved estates: \(estates)")
                    completion(.success(estates))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    func saveEstate(userId:Int, estateId:Int, completion: @escaping (Result<Void, Error>) -> Void){
        guard let url = URL(string: baseUrl2 + "/" + String(userId) + "/save/" + String(estateId)) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let error = error {
                print(error)
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
                if httpResponse.statusCode == 200 {
                    print("Estate saved successfully!")
                }
                else {
                    print("Failed to save estate.")
                }
            }
            
            if let data = data {
                if let responseJSON = try? JSONSerialization.jsonObject(with: data,options: []){
                    print("Response JSON: \(responseJSON)")
                }
            }
            
        }.resume()
    }
    
    func unsaveEstate(userId:Int, estateId:Int, completion: @escaping (Result<Void, Error>) -> Void){
        guard let url = URL(string: baseUrl2 + "/" + String(userId) + "/unsave/" + String(estateId)) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let error = error {
                print(error)
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
                if httpResponse.statusCode == 200 {
                    print("Estate unsaved successfully!")
                }
                else {
                    print("Failed to unsave estate.")
                }
            }
            
            if let data = data {
                if let responseJSON = try? JSONSerialization.jsonObject(with: data,options: []){
                    print("Response JSON: \(responseJSON)")
                }
            }
            
        }.resume()
    }
    
}
