//
//  HomeView.swift
//  OutCodingAssignment
//
//  Created by Rey Messon on 5/15/24.
//

import Foundation
import SwiftUI

struct CatHomeView: View {
    @ObservedObject var viewModel = CatViewModel()
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            if isLoading {
                SkeletonView()
            } else {
                List(viewModel.catImages) { cat in
                    NavigationLink(destination: CatDetailView(catImage: cat)) {
                        RemoteImage(url: cat.imageUrl, width: 100, height: 100)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 4)
                                    .frame(width: 200, height: 200)
                            )
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }
                }
            }
        }
        .onAppear {
            self.viewModel.fetchCatImages {
                self.isLoading = false
            }
        }
    }
}

struct SkeletonView: View {
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<6) { _ in
                SkeletonItem()
            }
        }
        .padding()
    }
}

struct SkeletonItem: View {
    @State private var isShimmering = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(Color.gray.opacity(0.4))
            .frame(height: 100)
            .modifier(ShimmerAnimation(isShimmering: isShimmering))
            .onAppear {
                self.isShimmering = true
            }
            .onDisappear {
                self.isShimmering = false
            }
    }
}

struct ShimmerAnimation: ViewModifier {
    let isShimmering: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0), Color.white.opacity(0.5), Color.white.opacity(0)]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .mask(content)
                .opacity(isShimmering ? 1 : 0) // Control opacity to show/hide shimmer
                .offset(x: -200) // Initial position off-screen
                .animation(
                    Animation.linear(duration: 1.1).repeatForever(autoreverses: false) // Adjust duration as needed
                    .repeatForever(autoreverses: false) // Repeat shimmering effect
                )
            )
    }
}
