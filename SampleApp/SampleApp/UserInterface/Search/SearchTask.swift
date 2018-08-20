//
//  SearchTask.swift
//  SampleApp
//
//  Created by Sahil Ishar on 8/19/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import Foundation

typealias SearchCompletion = (_ response: SearchMeetupsResponse?, _ error: SAServiceError?)->()

protocol SearchTask {
    
    func search(_ cityState: String?, zip: String?, completion: @escaping SearchCompletion)
}
