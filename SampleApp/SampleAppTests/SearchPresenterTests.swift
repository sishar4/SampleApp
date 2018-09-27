//
//  SearchPresenterTests.swift
//  SampleAppTests
//
//  Created by Sahil Ishar on 9/27/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import XCTest
@testable import SampleApp

class SearchPresenterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetLocalizedString() {
        let presenter = SearchPresenter()
        let localizedStr = presenter.getLocalizedText("test")
        XCTAssertEqual(localizedStr, Constants.searchFormErrorLabel)
    }
}
