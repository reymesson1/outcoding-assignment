//
//  RemoteImage.swift
//  OutCodingAssignment
//
//  Created by Rey Messon on 5/15/24.
//

import Foundation
import SwiftUI

struct RemoteImage: View {
    private let url: URL
    @State private var image: Image? = nil
    @State private var width: CGFloat
    @State private var height: CGFloat
    
    init(url: URL, width: CGFloat, height: CGFloat) {
        self.url = url
        self.width = width
        self.height = height
    }
    
    var body: some View {
        if let image = image {
            image
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
        } else {
            ProgressView()
                .onAppear {
                    loadImage()
                }
        }
    }
    
    private func loadImage() {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = Image(uiImage: uiImage)
                }
            }
        }.resume()
    }
}
