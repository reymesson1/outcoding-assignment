//
//  ContentView.swift
//  OutCodingAssignment
//
//  Created by user258061 on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HomeView()
                .navigationTitle("Posts")
        }
        .environmentObject(CatViewModel()) // Injecting the ViewModel as an environment object
    }
}

#Preview {
    ContentView()
}
