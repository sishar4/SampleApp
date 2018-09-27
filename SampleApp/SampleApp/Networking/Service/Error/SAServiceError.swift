//
//  SAServiceError.swift
//  SampleApp
//
//  Created by Sahil Ishar on 8/19/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import Foundation

protocol SAServiceError {
    var code: Int? { get }
    var domain: String? { get }
    var networkErrorMessage: SANetworkError { get }
}

struct ServiceError: SAServiceError {
    let code: Int?
    
    let domain: String?
    
    let networkErrorMessage: SANetworkError
}
