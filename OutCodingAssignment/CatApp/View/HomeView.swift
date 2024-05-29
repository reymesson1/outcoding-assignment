//
//  HomeView.swift
//  OutCodingAssignment
//
//  Created by Rey Messon on 5/15/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    var body: some View {
        CustomTabBar()
            .environment(\.locale, .current)
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
    }
}
