//
//  NetworkManager.swift
//  Project1 - 15.0
//
//  Created by Donat Bajrami on 4.9.21.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "https://reqres.in/api/users"
    let cache = NSCache<NSString, UIImage>()
    let decoder = JSONDecoder()
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    
    func getSingleUserInfoAsync(with userID: Int) async throws -> User {
        let endpoint = baseURL + "/\(userID)"
        
        guard let url = URL(string: endpoint) else {
            throw DBError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw DBError.invalidResponse
        }
        
        do {
            let users = try decoder.decode(UserInfoData.self, from: data)
            return users.data
        } catch {
            throw DBError.invalidData
        }
    }
    
    
    func getUsersInfoAsync(perPage: Int) async throws -> [User] {
        let completedEndpoint = baseURL + "?per_page=\(perPage)"
        
        guard let url = URL(string: completedEndpoint) else {
            throw DBError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw DBError.invalidResponse
        }
        
        do {
            let data = try decoder.decode(UserData.self, from: data)
            return data.data
        } catch {
            throw DBError.invalidData
        }
    }
    
    
    func downloadImageAsync(from urlString: String) async -> UIImage? {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) { return image }
        
        guard let url = URL(string: urlString) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil }
            cache.setObject(image, forKey: cacheKey)
            return image
        } catch {
            return nil
        }
    }
}



