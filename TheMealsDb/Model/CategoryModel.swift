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
  var id: String { strCategory }
  let strCategory: String
  let strCategoryThumb: String
  let strCategoryDescription: String
}
