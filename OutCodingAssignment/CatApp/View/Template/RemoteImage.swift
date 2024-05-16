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
    
    init(url: URL) {
        self.url = url
    }
    
    var body: some View {
        if let image = image {
            image.resizable()
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
