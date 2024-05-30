//
//  OfflineScreen.swift
//  OutCodingAssignment
//
//  Created by Rey Messon on 5/30/24.
//

import Foundation
import SwiftUI

struct OfflineScreen: View {
    var body: some View {
        VStack{
            Image("cat-bin")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
            Text("You don't have internet connection")
                .font(.subheadline)
        }
    }
}
