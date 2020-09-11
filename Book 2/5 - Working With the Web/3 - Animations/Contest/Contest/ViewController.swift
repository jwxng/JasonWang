//
//  ViewController.swift
//  Contest
//
//  Created by Student on 2020-07-01.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButton(_ sender: UIButton) {
        if emailTextField.text == "" {
            UIView.animate(withDuration: 0.25, animations:  {
                self.emailTextField.transform = CGAffineTransform(translationX: 5, y: 0)
            }) { (_) in
                self.emailTextField.transform = CGAffineTransform.identity
            }
            print("test")
        } else {
            performSegue(withIdentifier: "submitSegue", sender: UIViewController.self)
        }
    }
    
}

