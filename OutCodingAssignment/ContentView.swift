//
//  ContentView.swift
//  OutCodingAssignment
//
//  Created by Rey Messon on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var networkManager = NetworkManager()

    var body: some View {
        NavigationView {
            if networkManager.isConnected {
                SplashScreen()
            } else {
                OfflineScreen()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onReceive(NotificationCenter.default.publisher(for: .reachabilityChanged)) { _ in
            self.networkManager.updateConnection()
        }
    }
}

#Preview {
    ContentView()
}
