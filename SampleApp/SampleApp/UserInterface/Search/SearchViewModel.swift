//
//  SearchViewModel.swift
//  SampleApp
//
//  Created by Sahil Ishar on 8/19/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import Foundation

typealias SearchCompletion = (_ response: SearchMeetupsResponse?, _ error: SAServiceError?)->()

protocol SearchMeetups {
    
    func search(_ cityState: String?, zip: String?, completion: @escaping SearchCompletion)
    func searchRequest(fromCityState cityState: String?, zip: String?) -> ServiceRequest
}

final class SearchViewModel {
    
    var networkManager: SANetworkManager
    
    init(networkManager: SANetworkManager) {
        self.networkManager = networkManager
    }
    
    func getLocalizedText(_ label: String) -> String {
        // TODO: get localized string for label name
        return Constants.searchFormErrorLabel
    }
}

extension SearchViewModel: SearchMeetups {

    func search(_ cityState: String?, zip: String?, completion: @escaping SearchCompletion) {
        
        let request: ServiceRequest = searchRequest(fromCityState: cityState, zip: zip)
        networkManager.executeRequest(request, responseType: SearchMeetupsResponse.self) { (response, error) in
            
            completion(response as? SearchMeetupsResponse, error)
        }
    }
    
    func searchRequest(fromCityState cityState: String?, zip: String?) -> ServiceRequest {
        var queryParams = [String: String]()
        if let cityOrState = cityState {
            queryParams["location"] = cityOrState
        }
        if let zipCode = zip {
            queryParams["zip"] = zipCode
        }
        let request = ServiceRequest.init(method: .GET, url: Constants.baseUrl, headers: ["Content-Type":"application/json"], body: nil, queryParams: queryParams, timeoutInterval: 30)
        return request
    }
}
