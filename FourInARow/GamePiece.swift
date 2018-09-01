//
//  GamePiece.swift
//  FourInARow
//
//  Created by Adland Lee on 8/27/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

class GamePiece: UIButton {
    
    enum Player {
        case one, two
    }
    
    enum Keys: String {
        case
        highlightColor,
        selectedColor
    }
    
    let playerStates: [Player:[Keys:Any]] = [
        Player.one: [
            Keys.highlightColor: UIColor.magenta,
            Keys.selectedColor: UIColor.red
        ],
        Player.two: [
            Keys.highlightColor: UIColor.yellow,
            Keys.selectedColor: UIColor.orange
        ]
    ]
    
    var playerPosition: Player?

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // is point within our bounds
        guard bounds.contains(point) else {
            return nil
        }
        
        // for each subview, in reverse order
        // let hitView = // recursive call on subview
        // if hitView != nil {
        //    return hitVeiw
        // }
        
        return self
    }
}
