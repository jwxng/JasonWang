//
//  Order.swift
//  RestaurantMenu
//
//  Created by Student on 2020-07-23.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
