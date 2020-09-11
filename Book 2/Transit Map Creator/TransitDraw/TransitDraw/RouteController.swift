//
//  RouteController.swift
//  TransitDraw
//
//  Created by Student on 2020-08-26.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation

class RouteController {
    let baseURL = URL(string: "")!
    /*
    let vehicleLocationURL = URL(string: "")!
    let tripUpdateURL = URL(string: "")!
    let scheduledDataURL = URL(string: "")!
    */
    
    func fetchAgency(completion: @escaping ([String]?) -> Void) {
        let agencyURL = baseURL.appendingPathComponent("agency.txt")
        
        let task = URLSession.shared.dataTask(with: agencyURL)
        { (data, response, error) in
            
        }
        task.resume()
    }
    
    func fetchStop(completion: @escaping ([String]?) -> Void) {
        
    }
}
