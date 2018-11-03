//
//  SearchMeetupsResponse.swift
//  SampleApp
//
//  Created by Sahil Ishar on 8/19/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import Foundation

struct SearchMeetupsResponse {
    
//    let meetups: [MeetupGroup]
}

extension SearchMeetupsResponse: SAServiceResponse {
    
    private enum SearchMeetupsResponseCodingKeys: String, CodingKey {
        case meetups = "response"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SearchMeetupsResponseCodingKeys.self)
        
//        meetups = try container.decode([MeetupGroup].self, forKey: .meetups)
    }
}
