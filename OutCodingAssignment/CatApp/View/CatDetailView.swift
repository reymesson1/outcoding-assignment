//
//  CatDetailView.swift
//  OutCodingAssignment
//
//  Created by Rey Messon on 5/15/24.
//

import Foundation
import SwiftUI

struct CatDetailView: View {
    let catImage: CatImage
    
    var body: some View {
        VStack {
            Text("Cat \(catImage.id)")
                .font(.title)
            RemoteImage(url: catImage.imageUrl)
                .aspectRatio(contentMode: .fit)
                .padding()
            Text("Tags: \(catImage.tags.joined(separator: ", "))")
                .padding()
            Spacer()
        }
    }
}
