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
    var gameBoardInput = [GamePiece]()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in 0 ..< numberOfCols {
            let button = GamePiece()
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
            button.setTitle("\(i)", for: .normal)
            button.isHighlighted = false
            button.isSelected = false
            
            button.playerPosition = GamePiece.Player.one
        }
    }
    
    @objc func touchedInputButton(_ button: UIButton, with event: UIControlEvents) {
        updateButtonColor(forButton: button, forEvent: event)
    }

    func updateButtonColor(forButton target: UIButton, forEvent event: UIControlEvents) {
        switch event {
        case .touchDown:
            for button in gameBoardInput {
                button.backgroundColor = button === target ? .red : .lightGray
            }
        case .touchDragOutside:
            target.backgroundColor = .lightGray
        case .touchDragExit:
            target.backgroundColor = .lightGray
        case .touchDragEnter:
            target.backgroundColor = .red
        case .touchDragInside:
            target.backgroundColor = .red
        case .touchUpInside:
            print("Touch up inside \(target.titleLabel?.text)")
            target.backgroundColor = .red
        default:
            break
        }
    }
}
