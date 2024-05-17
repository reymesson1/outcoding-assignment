//
//  CatViewModelTests.swift
//  OutCodingAssignmentTests
//
//  Created by user258061 on 5/16/24.
//

import Foundation
import XCTest
@testable import OutCodingAssignment

class CatViewModelTests: XCTestCase {

    var catViewModel: CatViewModel!

    override func setUp() {
        super.setUp()
        catViewModel = CatViewModel()
    }

    override func tearDown() {
        catViewModel = nil
        super.tearDown()
    }

    func testFetchCatImages() {
        let expectation = XCTestExpectation(description: "Fetch cat images")
        catViewModel.fetchCatImages()
        XCTWaiter().wait(for: [expectation], timeout: 10)
        XCTAssertFalse(catViewModel.catImages.isEmpty, "Cat images array should not be empty")
    }
}
