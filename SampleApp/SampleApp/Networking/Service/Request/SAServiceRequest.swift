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
}

struct ServiceRequest: SAServiceRequest {
    let method: SAServiceHTTPMethod
    
    let url: String
    
    let headers: [String : String]
    
    let body: [String : Any]?
    
    let timeoutInterval: Int?
}
