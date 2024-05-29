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
    @State private var isLoading = true // Add a state to track loading state
    
    var body: some View {
        NavigationView {
            if isLoading {
                CatHomeSkeletonView() // Show skeleton while loading
            } else {
                List(viewModel.catImages) { cat in
                    NavigationLink(destination: CatDetailView(catImage: cat)) {
                        CatItemView(cat: cat)
                    }
                }
                .navigationBarTitle("Cat Home")
            }
        }
        .onAppear {
            self.viewModel.fetchCatImages { // Use completion to toggle loading state
                isLoading = false
            }
        }
    }
}


struct CatItemView: View {
    let cat: CatModel
    
    var body: some View {
        HStack {
            RemoteImage(url: cat.imageUrl, width: 100, height: 100)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .frame(width: 100, height: 100)
                )
                .clipShape(Circle())
                .shadow(radius: 10)
            
            VStack(alignment: .leading) {
                Text(cat.name)
                    .font(.headline)
                Text(cat.description)
                    .font(.subheadline)
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 8)
    }
}
