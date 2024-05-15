//
//  OutCodingAssignmentApp.swift
//  OutCodingAssignment
//
//  Created by user258061 on 5/15/24.
//

import SwiftUI

@main
struct OutCodingAssignmentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(CatViewModel())
        }
    }
}
