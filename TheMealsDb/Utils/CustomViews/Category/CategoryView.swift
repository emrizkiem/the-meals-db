//
//  CategoryView.swift
//  TheMealsDb
//
//  Created by M. Rizki Maulana on 14/01/25.
//

import SwiftUI

struct CategoryView: View {
  var category: CategoryModel
  
  var body: some View {
    HStack {
      if let url = URL(string: category.strCategoryThumb) {
        AsyncImage(url: url) { image in
          image.resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
        } placeholder: {
          Color.gray
            .frame(width: 50, height: 50)
        }
      }
      
      Text(category.strCategory)
        .font(.headline)
      
      Spacer()
    }
    .padding()
  }
}
