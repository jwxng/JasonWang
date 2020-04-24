//
//  ViewController.swift
//  20.1 RPS
//
//  Created by Student on 2020-04-01.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var opponentSignLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    
    @IBOutlet weak var playAgain: UIButton!
    
    func stateViewController(_ state: GameState) {
        switch state {
        case .start:
            opponentSignLabel.text = "🤖"
            playAgain.isHidden = true
            rock.isHidden = false
            paper.isHidden = false
            scissors.isHidden = false
            rock.isEnabled = true
            paper.isEnabled = true
            scissors.isEnabled = true
            
        case .win:
            gameStatusLabel.text = "You Win!"
            
        case .draw:
            gameStatusLabel.text = "You Drew."
        
        case .lose:
            gameStatusLabel.text = "You Lost."
        }
    }
    
    func play(_ playerSign: Sign) {
        let opponentSign = randomSign()
        let state = signComparing(playerSign, opponentSign)
        
        stateViewController(state)
        
        opponentSignLabel.text = opponentSign.emoji
        rock.isEnabled = false
        paper.isEnabled = false
        scissors.isEnabled = false
        playAgain.isHidden = false
        
        switch playerSign {
        case .rock:
            paper.isHidden = true
            scissors.isHidden = true
        case .paper:
            rock.isHidden = true
            scissors.isHidden = true
        case .scissors:
            rock.isHidden = true
            paper.isHidden = true
        }
    }
    
    @IBAction func rockButton(_ sender: Any) {
        play(Sign.rock)
    }
    @IBAction func paperButton(_ sender: Any) {
        play(Sign.paper)
    }
    @IBAction func scissorsButton(_ sender: Any) {
        play(Sign.scissors)
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
        stateViewController(GameState.start)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stateViewController(GameState.start)
    }
    
}

