//
//  ToastView.swift
//  TheMealsDb
//
//  Created by M. Rizki Maulana on 15/01/25.
//

import SwiftUI

struct ToastView: View {
  @ObservedObject var toastManager: ToastManager
  
  var body: some View {
    VStack {
      if let message = toastManager.message, toastManager.isShowing {
        Text(message)
          .padding()
          .background(Color.black.opacity(0.7))
          .foregroundColor(.white)
          .transition(.move(edge: .bottom))
          .animation(.easeInOut)
      }
    }
    .padding(.bottom, 50)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
  }
}
