//
//  MeetupGroup.swift
//  SampleApp
//
//  Created by Sahil Ishar on 8/19/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import Foundation

struct MeetupGroup {
    
    let id: Int
    let name: String
    let description: String
    let url: String
}

extension MeetupGroup: SAServiceResponse {
    
    enum MeetupGroupCodingKeys: String, CodingKey {
        case id
        case name
        case description = "plain_text_description"
        case url = "link"
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MeetupGroupCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        url = try container.decode(String.self, forKey: .url)
    }
}
