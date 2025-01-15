//
//  CategoryModel.swift
//  TheMealsDb
//
//  Created by M. Rizki Maulana on 14/01/25.
//

import Foundation

struct CategoryResponse: Codable {
  let categories: [CategoryModel]
}

struct CategoryModel: Identifiable, Codable {
  let idCategory: String
  let strCategory: String
  let strCategoryDescription: String
  let strCategoryThumb: String
  
  var id: String { strCategory }
}
