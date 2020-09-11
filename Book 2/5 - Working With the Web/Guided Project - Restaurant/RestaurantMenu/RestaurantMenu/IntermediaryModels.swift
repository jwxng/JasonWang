//
//  IntermediaryModels.swift
//  RestaurantMenu
//
//  Created by Student on 2020-07-23.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
