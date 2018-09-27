//
//  ServiceRequestTests.swift
//  SampleAppTests
//
//  Created by Sahil Ishar on 9/27/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import XCTest
@testable import SampleApp

class ServiceRequestTests: XCTestCase {

    var method: SAServiceHTTPMethod?
    var url: String?
    var headers: [String: String]?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        method = SAServiceHTTPMethod.GET
        url = "http://test.com"
        headers = ["Content-Type": "application/json"]
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        method = nil
        url = nil
        headers = nil
    }

    func testRequestInitSuccess() {
        let request = ServiceRequest(method: method!, url: url!, headers: headers!, body: nil, timeoutInterval: nil)
        XCTAssertNotNil(request)
    }
    
    func testRequestInitRequiredPropertiesSuccess() {
        let request = ServiceRequest(method: method!, url: url!, headers: headers!, body: nil, timeoutInterval: nil)
        XCTAssertEqual(request.method, method!, "HTTP method set incorrectly.")
        XCTAssertEqual(request.url, url!, "Url set incorrectly.")
        XCTAssertEqual(request.headers, headers!, "Headers set incorrectly.")
        XCTAssertNil(request.body, "Body should be nil")
        XCTAssertNil(request.timeoutInterval, "Time interval should be nil")
    }
    
    func testRequestInitAllPropertiesSuccess() {
        let body: [String: Any] = ["sample": 10]
        let timeoutInterval = 30
        let request = ServiceRequest(method: method!, url: url!, headers: headers!, body: body, timeoutInterval: timeoutInterval)
        XCTAssertEqual(request.method, method!, "HTTP method set incorrectly.")
        XCTAssertEqual(request.url, url!, "Url set incorrectly.")
        XCTAssertEqual(request.headers, headers!, "Headers set incorrectly.")
        XCTAssertEqual(NSDictionary(dictionary: request.body!), body as NSDictionary, "Body set incorrectly.")
        XCTAssertEqual(request.timeoutInterval, timeoutInterval, "Timeout interval set incorrectly.")
    }
}
