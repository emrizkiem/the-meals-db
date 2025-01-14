//
//  TheMealsDbApp.swift
//  TheMealsDb
//
//  Created by M. Rizki Maulana on 14/01/25.
//

import SwiftUI

@main
struct TheMealsDbApp: App {
    var body: some Scene {
        WindowGroup {
          CategoryListView(viewModel: CategoryViewModel())
        }
    }
}
