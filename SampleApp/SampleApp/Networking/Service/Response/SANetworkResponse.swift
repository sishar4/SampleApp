//
//  SANetworkResponse.swift
//  SampleApp
//
//  Created by Sahil Ishar on 8/19/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import Foundation

enum SANetworkResponse<SANetworkError> {
    case success
    case failure(SANetworkError)
}
