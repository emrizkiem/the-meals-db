//
//  CategoryListView.swift
//  TheMealsDb
//
//  Created by M. Rizki Maulana on 14/01/25.
//

import SwiftUI

struct CategoryListView: View {
  @ObservedObject var viewModel: CategoryViewModel
  
  var body: some View {
    NavigationView {
      VStack {
        if viewModel.isLoading {
          ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .padding()
        } else if let errorMessage = viewModel.errorMessage {
          Text("Error: \(errorMessage)")
            .foregroundColor(.red)
            .padding()
        } else {
          TextField("Search Categories", text: $viewModel.searchText)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
          
          List(viewModel.filteredCategories) { category in
            NavigationLink(destination: CategoryDetailView(
              category: category.strCategory,
              description: category.strCategoryDescription,
              imageUrl: category.strCategoryThumb
            )) {
              CategoryView(category: category)
            }
          }
          .listStyle(PlainListStyle())
        }
      }
      .onAppear {
        viewModel.fetchCategories()
      }
    }
  }
}
