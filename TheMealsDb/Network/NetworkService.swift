//
//  NetworkService.swift
//  TheMealsDb
//
//  Created by M. Rizki Maulana on 14/01/25.
//

import Foundation

class NetworkService {
  static let shared = NetworkService()
  
  private init() {}
  
  func fetchCategories(completion: @escaping (Result<[CategoryModel], Error>) -> Void) {
    guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else {
      completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      if let error = error {
        completion(.failure(error))
        return
      }
      
      guard let data = data else {
        completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
        return
      }
      
      do {
        let response = try JSONDecoder().decode(CategoryResponse.self, from: data)
        completion(.success(response.categories))
      } catch {
        completion(.failure(error))
      }
    }
    
    task.resume()
  }
}
