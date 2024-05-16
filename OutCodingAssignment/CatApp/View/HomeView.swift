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
        
    var body: some View {
        NavigationView {
            List(viewModel.catImages) { cat in
                NavigationLink(destination: CatDetailView(catImage: cat)) {
                    RemoteImage(url: cat.imageUrl)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
            }
        }
        .onAppear {
            self.viewModel.fetchCatImages()
        }
    }
}
