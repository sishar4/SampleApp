//
//  SANetworkError.swift
//  SampleApp
//
//  Created by Sahil Ishar on 8/19/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import Foundation

enum SANetworkError: String {
    case malformedRequest       = "Malformed request."
    case badRequest             = "Bad request."
    case authenticationError    = "Authentication failed."
    case outdated               = "The url you requested is outdated."
    case failed                 = "Network request failed. Unknown error."
    case noData                 = "Response returned with no data to decode."
    case unableToDecode         = "We could not decode the response."
}
