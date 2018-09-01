//
//  GamePieceRed.swift
//  FourInARow
//
//  Created by Adland Lee on 8/27/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

class GamePieceRed: UIButton, GamePiece {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .magenta : nil
        }
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? .red : nil
        }
    }
}
