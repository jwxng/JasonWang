//
//  OrderConfirmationViewController.swift
//  RestaurantMenu
//
//  Created by Student on 2020-07-29.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    @IBOutlet var timeRemainingLabel: UILabel!
    var minutes: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeRemainingLabel.text = "Thank you for your order! Your wait time is approximately \(minutes!) minutes."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToOrderList(segue: UIStoryboardSegue) {
        if segue.identifier == "DismissConfirmation" {
            MenuController.shared.order.menuItems.removeAll()
        }
        
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the selected object to the new view controller.
    }
     */

}
