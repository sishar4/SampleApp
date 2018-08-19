//
//  SAServiceRequest.swift
//  SampleApp
//
//  Created by Sahil Ishar on 8/19/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import Foundation

protocol SAServiceRequest {
    var method: SAServiceHTTPMethod { get }
    var url: String { get }
    var headers: [String: String] { get }
    var body: [String: Any]? { get }
    var timeoutInterval: Int? { get }
    
    init(_ url: String, headers: [String: String], body: [String: Any]?, timeoutInterval: Int?)
}