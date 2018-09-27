//
//  SearchPresenter.swift
//  SampleApp
//
//  Created by Sahil Ishar on 8/19/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import Foundation

final class SearchPresenter {
    
    func getLocalizedText(_ label: String) -> String {
        // TODO: get localized string for label name
        return Constants.searchFormErrorLabel
    }
}

extension SearchPresenter: SearchTask {
    
    func search(_ cityState: String?, zip: String?, completion: @escaping SearchCompletion) {
        
    }
}
