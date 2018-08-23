//
//  GameBoardView.swift
//  FourInARow
//
//  Created by Adland Lee on 8/22/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

class GameBoardView: UIView {
    
    let numberOfRows = 6
    let numberOfCols = 7
    let spacing = 2
    var gameBoard = [[UIButton]]()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in 0 ..< numberOfRows {
            var row = [UIButton]()
            for _ in 0 ..< numberOfCols {
                let button = UIButton()
                row.append(button)
                addSubview(button)
            }
            gameBoard.append(row)
        }
    }
    
    override func layoutSubviews() {
        let buttonSize = Int((frame.size.width - CGFloat(numberOfCols * spacing)) / CGFloat(numberOfCols))
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for r in 0 ..< gameBoard.count  {
            for c in 0 ..< gameBoard[0].count {
                let button = gameBoard[r][c]
                buttonFrame.origin.x = CGFloat(c * (buttonSize + spacing))
                buttonFrame.origin.y = CGFloat((gameBoard.count - 1 - r) * (buttonSize + spacing))
                button.frame = buttonFrame
                button.backgroundColor = UIColor.lightGray
                button.setTitle("\(c),\(r)", for: .normal)
            }
        }
    }
}
