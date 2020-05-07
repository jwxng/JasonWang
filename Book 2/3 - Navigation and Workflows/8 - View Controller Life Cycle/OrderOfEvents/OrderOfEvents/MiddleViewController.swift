//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Student on 2020-05-07.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet var middleTopLabel: UILabel!
    var eventNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let existingText = middleTopLabel else {return}
        middleTopLabel.text = "\(existingText)\nEvent Number \(eventNumber)"
        eventNumber += 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let existingText = middleTopLabel else {return}
        middleTopLabel.text = "\(existingText)\nEvent Number \(eventNumber)"
        eventNumber += 1
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let existingText = middleTopLabel else {return}
        middleTopLabel.text = "\(existingText)\nEvent Number \(eventNumber)"
        eventNumber += 1
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let existingText = middleTopLabel else {return}
        middleTopLabel.text = "\(existingText)\nEvent Number \(eventNumber)"
        eventNumber += 1
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard let existingText = middleTopLabel else {return}
        middleTopLabel.text = "\(existingText)\nEvent Number \(eventNumber)"
        eventNumber += 1
    }
}
