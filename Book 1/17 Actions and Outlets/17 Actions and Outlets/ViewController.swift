//
//  ViewController.swift
//  17 Actions and Outlets
//
//  Created by Student on 2020-03-13.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    func updateColour() {
        var red: CGFloat = 1
        var green: CGFloat = 1
        var blue: CGFloat = 1
        
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
        }
        
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
        }
        
        let colour = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colourView.backgroundColor = colour
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateColour()
        colourView.layer.borderWidth = 5
        colourView.layer.cornerRadius = 20
        colourView.layer.borderColor = UIColor.black.cgColor
        updateControls()
    }

    @IBOutlet weak var colourView: UIView!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBAction func switchChanged(_ sender: UISwitch) {
    updateColour()
    updateControls()
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
    updateColour()
    }
    
    @IBAction func reset(_ sender: Any) {
        var red: CGFloat = 1
        var green: CGFloat =  1
        var blue: CGFloat = 1
        
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        updateColour()
    }
    
}


