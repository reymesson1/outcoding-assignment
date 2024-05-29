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
                        HStack {
                            RemoteImage(url: cat.imageUrl, width: 100, height: 100)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 4)
                                        .frame(width: 200, height: 200)
                                )
                                .clipShape(Circle())
                                .shadow(radius: 10)
                            
                            Spacer() // Add Spacer to push TagsView to the right
                            
                            // Display tags here
                            TagsView(tags: cat.tags ?? [])
                        }
                        .padding(.vertical, 8) // Add vertical padding for better spacing
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


struct TagsView: View {
    let tags: [String]?
    
    var body: some View {
        if let tags = tags {
            if !tags.isEmpty {
                HStack {
                    ForEach(tags, id: \.self) { tag in
                        Text(tag)
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
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
            .overlay(
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white.opacity(0),
                                    Color.white.opacity(0.5),
                                    Color.white.opacity(0)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .mask(
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: geometry.size.width * 0.3, height: geometry.size.height)
                                .offset(x: self.isShimmering ? geometry.size.width : -geometry.size.width)
                        )
                        .opacity(self.isShimmering ? 1 : 0)
                        .animation(
                            Animation.linear(duration: 1.5)
                            .repeatForever(autoreverses: false)
                        )
                }
            )
            .onAppear {
                self.isShimmering = true
            }
    }
}
