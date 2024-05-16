//
//  SplashScreen.swift
//  OutCodingAssignment
//
//  Created by Rey Messon on 5/16/24.
//

import Foundation
import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                HomeView()
            } else {
                Image("cat_splash")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 4)
                            .frame(width: 200, height: 200)
                    )
                    .clipShape(Circle())
                    .shadow(radius: 10)

            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
