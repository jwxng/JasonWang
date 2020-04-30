//
//  ViewController.swift
//  Two Buttons
//
//  Created by Student on 2020-04-28.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    
    @IBAction func setTextButtonTapped(_ sender: UIButton) {
    label.text = textField.text
    }
    
    @IBAction func clearTextButtonTapped(_ sender: UIButton) {
        label.text = String()
        textField.text = String()
    }
}

