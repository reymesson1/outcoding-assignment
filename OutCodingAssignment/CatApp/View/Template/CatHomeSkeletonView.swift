//
//  CatHomeSkeletonView.swift
//  OutCodingAssignment
//
//  Created by user258061 on 5/29/24.
//

import Foundation
import SwiftUI

struct CatHomeSkeletonView: View {
    var body: some View {
        VStack {
            ForEach(0..<3) { _ in // Placeholder for three cat images
                CatImageSkeleton()
                    .padding()
            }
        }
    }
}

struct CatImageSkeleton: View {
    var body: some View {
        HStack {
            SkeletonRectangle(width: 100, height: 100)
            VStack(alignment: .leading, spacing: 8) {
                SkeletonRectangle(width: 150, height: 20)
                SkeletonRectangle(width: 100, height: 20)
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 8)
    }
}

struct SkeletonRectangle: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(Color.gray.opacity(0.3))
            .frame(width: width, height: height)
    }
}
