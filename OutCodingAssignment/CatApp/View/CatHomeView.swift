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
            ForEach(0..<5) { _ in
                SkeletonItem()
            }
        }
        .padding()
    }
}

struct SkeletonItem: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(Color.gray.opacity(0.4))
            .frame(height: 100)
    }
}
