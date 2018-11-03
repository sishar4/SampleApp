//
//  SANetworkManager.swift
//  SampleApp
//
//  Created by Sahil Ishar on 8/19/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import Foundation

typealias SANetworkCompletion = (_ response: SAServiceResponse?,_ error: SAServiceError?)->()

protocol SANetworkManager {
    var timeout: Int? { get }
    func buildRequest(_ request: SAServiceRequest) throws -> URLRequest
    func executeRequest<T: SAServiceResponse>(_ urlRequest: SAServiceRequest, responseType: T.Type, completion: @escaping SANetworkCompletion)
    func handleNetworkResponse(_ response: HTTPURLResponse) -> SANetworkResponse<SANetworkError>
}

class NetworkManager: SANetworkManager {

    var timeout: Int?
    
    func buildRequest(_ request: SAServiceRequest) throws -> URLRequest {
        timeout = request.timeoutInterval
        var url: URL?
        
        if let queryParams = request.queryParams {
            var urlString = request.url
            for (key, value) in queryParams {
                let stringToAppend = "&\(key)=\(value)"
                urlString.append(stringToAppend)
            }
            url = URL(string: urlString)
        }
        
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = request.method.rawValue
        addHeaders(request.headers, request: &urlRequest)
        
        if let timeoutInterval = request.timeoutInterval {
            timeout = timeoutInterval
            urlRequest.timeoutInterval = TimeInterval(exactly: timeoutInterval) ?? 30
        }
        
        return urlRequest
    }
    
    func executeRequest<T: SAServiceResponse>(_ urlRequest: SAServiceRequest, responseType: T.Type, completion: @escaping SANetworkCompletion) {
        
        let session = URLSession.shared
        do {
            let request: URLRequest = try buildRequest(urlRequest)
            session.dataTask(with: request) { (data, urlResponse, error) in
                
                if let httpUrlResponse = urlResponse as? HTTPURLResponse {
                    let result = self.handleNetworkResponse(httpUrlResponse)
                    switch result {
                    case .success:
                        guard let responseData = data else {
                            let serviceNoDataError = ServiceError.init(code: nil, domain: nil, networkErrorMessage: SANetworkError.noData)
                            completion(nil, serviceNoDataError)
                            return
                        }
                        do {
                            let response = try self.parseResponse(into: responseType, from: responseData)
                            completion(response, nil)
                        } catch {
                            completion(nil, error as? SAServiceError)
                        }
                        
                    case .failure(let networkError):
                        let serviceError = ServiceError.init(code: nil, domain: nil, networkErrorMessage: networkError)
                        completion(nil, serviceError)
                    }
                }
            }.resume()
        } catch {
            let unknownError = ServiceError.init(code: nil, domain: nil, networkErrorMessage: SANetworkError.failed)
            completion(nil, unknownError)
        }
    }
    
    func handleNetworkResponse(_ response: HTTPURLResponse) -> SANetworkResponse<SANetworkError> {
        
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(SANetworkError.authenticationError)
        case 501...599: return .failure(SANetworkError.badRequest)
        case 600: return .failure(SANetworkError.outdated)
        default: return .failure(SANetworkError.failed)
        }
    }
}

private extension NetworkManager {
    
    func parseResponse<T>(into type: T.Type, from data: Data) throws -> T where T : Decodable {
        
        let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
        print(jsonData)
        let response = try JSONDecoder().decode(T.self, from: data)
        return response
    }
    
    func addHeaders(_ headers: [String: String], request: inout URLRequest) {
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
