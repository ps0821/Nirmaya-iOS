//
//  LoginAuth.swift
//  Niramaya
//
//  Created by Yash's Mackbook on 11/12/24.
//

import Foundation

struct LoginRequest: Codable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String
    let user: User
}

struct User: Codable {
    let id: String
    let email: String
    let fullName: String
    let contactNumber: String
}

func loginUser(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
    guard let url = URL(string: "https://niramaya-api.vercel.app/api/mobile/auth/login") else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("77607c77dfb7c7e8e92e53d6b49b90b2981299168ec0ebed082c78921f91ff68", forHTTPHeaderField: "x-api-key")
    
    let body = LoginRequest(email: email, password: password)
    request.httpBody = try? JSONEncoder().encode(body)
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            completion(.failure(NSError(domain: "Invalid Response", code: 0, userInfo: nil)))
            return
        }
        
        do {
            let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
            completion(.success(loginResponse))
        } catch {
            completion(.failure(error))
        }
    }
    
    task.resume()
}

