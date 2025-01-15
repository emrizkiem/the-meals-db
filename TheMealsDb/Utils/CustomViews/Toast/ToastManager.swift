//
//  ToastManager.swift
//  TheMealsDb
//
//  Created by M. Rizki Maulana on 15/01/25.
//

import SwiftUI

class ToastManager: ObservableObject {
  @Published var message: String? = nil
  @Published var isShowing: Bool = false
  
  func show(message: String) {
    self.message = message
    self.isShowing = true
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      self.isShowing = false
    }
  }
}
