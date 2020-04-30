//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Student on 2020-04-28.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    @IBOutlet var button: UIButton!
    @IBOutlet var toggle: UISwitch!
    @IBOutlet var slider: UISlider!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Button is tapped!")
        if toggle.isOn {
            print("Switch is on!")
        } else {
            print("Switch is off!")
        }
        
        print("The slider is set to \(slider.value)")
    }
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
}

