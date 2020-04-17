//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Student on 2020-04-16.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeTitle(_ sender: Any) {
        mainLabel.text = "test"
    }
}

