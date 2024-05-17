//
//  HomeView.swift
//  OutCodingAssignment
//
//  Created by Rey Messon on 5/15/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = CatViewModel()
    @State var isSelected: Int = 0
        
    var body: some View {
        NavigationView {
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
            CustomTabBar(selectedIndex: $isSelected)
            
        }
        .onAppear {
            self.viewModel.fetchCatImages()
        }
    }
}
