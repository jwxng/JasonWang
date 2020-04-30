//
//  ViewController.swift
//  Apple Pie
//
//  Created by Student on 2020-04-30.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["pineapple", "boombox", "vacuum", "laptop", "mouse", "goldfish", "television", "computer", "clothing", "poster"]
    let incorrectMovesAllowed = 7
    var totalWins = 0
    var totalLosses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    var currentGame: Game!
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
    }

    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
}

