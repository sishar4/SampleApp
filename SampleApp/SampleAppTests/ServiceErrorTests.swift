//
//  ServiceErrorTests.swift
//  SampleAppTests
//
//  Created by Sahil Ishar on 9/27/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import XCTest
@testable import SampleApp

class ServiceErrorTests: XCTestCase {

    var networkErrorMessage: SANetworkError?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        networkErrorMessage = SANetworkError.badRequest
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        networkErrorMessage = nil
    }

    func testErrorInitSuccess() {
        let error = ServiceError(code: nil, domain: nil, networkErrorMessage: networkErrorMessage!)
        XCTAssertNotNil(error)
    }
    
    func testErrorInitRequiredPropertiesSuccess() {
        let error = ServiceError(code: nil, domain: nil, networkErrorMessage: networkErrorMessage!)
        XCTAssertEqual(error.networkErrorMessage, networkErrorMessage!, "Network error message set incorrectly.")
        XCTAssertNil(error.code, "Code should be nil")
        XCTAssertNil(error.domain, "Domain should be nil")
    }
    
    func testRequestInitAllPropertiesSuccess() {
        let code = 101
        let domain = "com.sampleapp.network"
        let error = ServiceError(code: code, domain: domain, networkErrorMessage: networkErrorMessage!)
        XCTAssertEqual(error.networkErrorMessage, networkErrorMessage!, "Network error message set incorrectly.")
        XCTAssertEqual(error.code, code, "Code set incorrectly.")
        XCTAssertEqual(error.domain, domain, "Domain set incorrectly.")
    }
}
