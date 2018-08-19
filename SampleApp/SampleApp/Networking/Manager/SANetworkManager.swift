//
//  SANetworkManager.swift
//  SampleApp
//
//  Created by Sahil Ishar on 8/19/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import Foundation

typealias SANetworkCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol SANetworkManager {
    var timeout: Int? { get }
    func buildRequest(_ request: SAServiceRequest) throws -> URLRequest
    func executeRequest(_ urlRequest: URLRequest, responseType: SAServiceResponse, completion: @escaping SANetworkCompletion)
    func handleNetworkResponse(_ response: HTTPURLResponse) -> SANetworkResponse<String>
    func parseResponse<T>(into type: T.Type, from: Data) throws -> T where T: Decodable
}
