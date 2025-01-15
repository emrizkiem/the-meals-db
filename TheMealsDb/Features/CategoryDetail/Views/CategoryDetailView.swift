//
//  CategoryDetailView.swift
//  TheMealsDb
//
//  Created by M. Rizki Maulana on 15/01/25.
//

import SwiftUI

struct CategoryDetailView: View {
  var category: String
  var description: String
  var imageUrl: String?
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 16) {
//        Button(action: {
          // Action for back navigation
//        })
//        {
//          HStack {
//            Image(systemName: "chevron.left")
//            Text("Back")
//          }
//          .foregroundColor(.blue)
//        }
//        .padding(.top)
        
        Text(category)
          .font(.largeTitle)
          .fontWeight(.bold)
        
        if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
          AsyncImage(url: url) { image in
            image
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(height: 200)
              .cornerRadius(10)
          } placeholder: {
            Rectangle()
              .fill(Color.gray.opacity(0.3))
              .frame(height: 200)
              .cornerRadius(10)
              .overlay(
                Image(systemName: "photo")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 50, height: 50)
                  .foregroundColor(.gray)
              )
          }
        } else {
          Rectangle()
            .fill(Color.gray.opacity(0.3))
            .frame(height: 200)
            .cornerRadius(10)
            .overlay(
              Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            )
        }
        
        Text(description)
          .font(.body)
          .foregroundColor(.secondary)
        
        Spacer()
      }
      .padding()
    }
  }
}
