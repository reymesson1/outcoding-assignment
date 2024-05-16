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
            RemoteImage(url: catImage.imageUrl, width: Constants.width, height: Constants.height)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: Constants.lineWidth)
                        .frame(width: Constants.width, height: Constants.height)
                )
                .clipShape(Circle())
                .shadow(radius: Constants.radius)

            
            Text("Tags: \(catImage.tags.joined(separator: ", "))")
                .padding()
            Spacer()
        }
    }
    
    private enum Constants {
        
        static let width : CGFloat = 200
        static let height : CGFloat = 200
        static let radius : CGFloat = 10
        static let lineWidth : CGFloat = 10
        static let whiteColor = Color.white
        
        
    }
}
