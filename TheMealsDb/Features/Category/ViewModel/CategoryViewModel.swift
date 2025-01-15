//
//  CategoryViewModel.swift
//  TheMealsDb
//
//  Created by M. Rizki Maulana on 14/01/25.
//

import Foundation
import Combine

class CategoryViewModel: ObservableObject {
  @Published var categories: [CategoryModel] = []
  @Published var filteredCategories: [CategoryModel] = []
  @Published var searchText: String = "" {
    didSet {
      filterCategories()
    }
  }
  @Published var errorMessage: String? = nil
  @Published var isLoading: Bool = false
  
  init() {
    fetchCategories()
  }
  
  func fetchCategories() {
    isLoading = true
    NetworkService.shared.fetchCategories { [weak self] result in
      DispatchQueue.main.async {
        self?.isLoading = false
        switch result {
        case .success(let categories):
          self?.categories = categories
          self?.filteredCategories = categories
          self?.errorMessage = nil
        case .failure(let error):
          self?.errorMessage = error.localizedDescription
        }
      }
    }
  }
  
  private func filterCategories() {
    if searchText.isEmpty {
      filteredCategories = categories
    } else {
      filteredCategories = categories.filter {
        $0.strCategory.localizedCaseInsensitiveContains(searchText)
      }
    }
  }
}
