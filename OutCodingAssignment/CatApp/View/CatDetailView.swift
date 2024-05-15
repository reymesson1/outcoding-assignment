//
//  CatDetailView.swift
//  OutCodingAssignment
//
//  Created by user258061 on 5/15/24.
//

import Foundation
import SwiftUI

struct CatDetailView: View {
    let catImage: CatImage
    
    var body: some View {
        VStack {
            Text("Cat \(catImage.id)")
                .font(.title)
            RemoteImage(url: catImage.imageUrl) // Use imageUrl instead of url
                .aspectRatio(contentMode: .fit)
                .padding()
            Text("Tags: \(catImage.tags.joined(separator: ", "))")
                .padding()
            Spacer()
        }
    }
}
