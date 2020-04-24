//
//  Sign.swift
//  20.1 RPS
//
//  Created by Student on 2020-04-01.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

func signComparing(_ playerSign: Sign, _ opponentSign: Sign) -> GameState {
    switch playerSign {
        
    case .rock:
        switch opponentSign {
        case .rock:
            return .draw
        case .paper:
            return .lose
        case .scissors:
            return .win
        }
        
    case .paper:
        switch opponentSign {
        case .rock:
            return .win
        case .paper:
            return .draw
        case .scissors:
            return .lose
        }
    
    case .scissors:
        switch opponentSign {
        case .rock:
            return .lose
        case .paper:
            return .win
        case .scissors:
            return .draw
        }
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
}
