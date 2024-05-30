//
//  NetworkManager.swift
//  OutCodingAssignment
//
//  Created by Rey Messon on 5/30/24.
//

import Foundation
import Reachability

class NetworkManager: ObservableObject {
    private var reachability: Reachability!
    @Published var isConnected: Bool = true

    init() {
        do {
            self.reachability = try Reachability()
            try self.reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }

        self.updateConnection()
    }

    func updateConnection() {
        if let reachability = self.reachability {
            self.isConnected = reachability.connection != .unavailable
        }
    }
}
