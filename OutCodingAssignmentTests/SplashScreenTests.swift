//
//  SplashScreenTests.swift
//  OutCodingAssignmentTests
//
//  Created by Rey Messon on 5/16/24.
//

import Foundation
import XCTest

@testable import OutCodingAssignment 

class SplashScreenTests: XCTestCase {

    func testSplashScreenTransition() {
        let viewModel = SplashScreenViewModel()
        
        let expectation = XCTestExpectation(description: "Transition to HomeView after 2 seconds")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertTrue(viewModel.isActive)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }
}


class SplashScreenViewModel: ObservableObject {
    @Published var isActive = false
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isActive = true
        }
    }
}
