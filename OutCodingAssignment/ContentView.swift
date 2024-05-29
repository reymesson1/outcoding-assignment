//
//  ContentView.swift
//  OutCodingAssignment
//
//  Created by Rey Messon on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            SplashScreen()
                .environment(\.locale, .current)
        }
    }
}

#Preview {
    ContentView()
}
