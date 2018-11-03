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
        let presenter = SearchViewModel()
        let localizedStr = presenter.getLocalizedText("test")
        XCTAssertEqual(localizedStr, Constants.searchFormErrorLabel)
    }
    
    func testSearch() {
        
        let expectation = self.expectation(description: "Searching")
        
        let mockPresenter = MockSearchPresenter()
        mockPresenter.search("NY", zip: "11021") { (response, error) in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}

class MockSearchPresenter: NSObject, SearchMeetups {
    func search(_ cityState: String?, zip: String?, completion: @escaping SearchCompletion) {
        let meetup = MeetupGroup(id: 1, name: "Futsal NYC", description: "Futsal NYC", url: "http:www.nyc.com")
        let response = SearchMeetupsResponse(meetups: [meetup])
        completion(response, nil)
    }
}
