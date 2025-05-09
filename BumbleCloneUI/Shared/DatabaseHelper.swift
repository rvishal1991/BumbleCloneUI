//
//  DatabaseHelper.swift
//  SwiftfulSwiftUiPractice
//
//  Created by apple on 06/05/25.
//

import Foundation

struct DatabaseHelper {
    
//    func getProducts() async throws -> [Product] {
//        
//        guard let urlRest = URL(string: "https://dummyjson.com/products") else {
//            throw URLError(.badURL) }
//        let url = URLRequest(url: urlRest)
//        
//        let (data, _) = try await URLSession.shared.data(for: url)
//        let products = try JSONDecoder().decode(ProductArray.self, from: data)
//        return products.products ?? []
//        
//    }
    
    func getUsers() async throws -> [User] {
        guard let urlRest = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: urlRest))
        let users = try JSONDecoder().decode(UserArray.self, from: data)
        return users.users ?? []
    }
}



