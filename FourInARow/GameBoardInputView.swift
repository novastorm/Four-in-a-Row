//
//  GameBoardInputView.swift
//  FourInARow
//
//  Created by Adland Lee on 8/22/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

class GameBoardInputView: UIView {
    
    let numberOfCols = 7
    let spacing = 2
    var gameBoardInput = [UIButton]()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in 0 ..< numberOfCols {
            let button = UIButton()
            gameBoardInput.append(button)
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        let buttonSize = Int((frame.size.width - CGFloat(numberOfCols * spacing)) / CGFloat(numberOfCols))
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
            for (i, button) in gameBoardInput.enumerated() {
                buttonFrame.origin.x = CGFloat(i * (buttonSize + spacing))
                button.frame = buttonFrame
                button.backgroundColor = UIColor.lightGray
                button.setTitle("\(i)", for: .normal)
            }
    }
}
