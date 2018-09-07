//
//  GameBoardView.swift
//  FourInARow
//
//  Created by Adland Lee on 8/22/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

class GameBoardView: UIView {
    
    let spacing: CGFloat = 2
    var gameBoard = FourInARowGame()
    var gameBoardLayout = [[GameBoardSlotView]]()
    var slotSize: CGFloat!
    var gamePieces = [[GamePieceView]]()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupView()
    }
    
    private func setupView() {
//        let rows = gameBoard.numberOfRows
        let cols = gameBoard.numberOfColumns

        gameBoardLayout = Array(
            repeating: Array(
                repeating: GameBoardSlotView(),
                count: gameBoard.numberOfColumns
            ),
            count: gameBoard.numberOfRows
        )

        let count = CGFloat(cols)
        slotSize = (frame.size.width - CGFloat((count-1) * spacing)) / CGFloat(count)

        for r in 0 ..< gameBoard.numberOfRows {
            for c in 0 ..< gameBoard.numberOfColumns {
                let slotView = GameBoardSlotView()
                gameBoardLayout[r][c] = slotView
                addSubview(slotView)
            }
        }
    }
    
    override func layoutSubviews() {
        let rows = gameBoard.numberOfRows
        let cols = gameBoard.numberOfColumns
        
        var slotFrame = CGRect(x: 0, y: 0, width: slotSize, height: slotSize)
        
        for r in 0 ..< rows {
            for c in 0 ..< cols { 
                let slotView = gameBoardLayout[r][c]
                slotFrame.origin.x = CGFloat(c) * (slotSize + spacing)
                slotFrame.origin.y = (CGFloat(rows - 1) - CGFloat(r)) * (slotSize + spacing)
                slotView.frame = slotFrame
                slotView.textLabel.text = "\(c),\(r)"
            }
        }
    }
}
