//
//  GameBoardView.swift
//  FourInARow
//
//  Created by Adland Lee on 8/22/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

@IBDesignable
class UIGameBoardView: UIView {
    
    @IBInspectable
    var spacing: CGFloat = 2
    
    @IBInspectable
    var rows: Int = 6
    
    @IBInspectable
    var columns: Int = 7
    
    
//    var gameBoardLayout = [[GameBoardSlotView]]()
    var slotSize: CGFloat!
    var gamePieces = [[GamePieceView]]()

    
    // MARK: View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        initViews()
        updateView()
    }
    
    func initViews() {
        setupViews()
    }
    
    func updateView() {
        setNeedsDisplay()
    }
    private func setupViews() {
//        let rows = gameBoard.numberOfRows
//        let cols = gameBoard.numberOfColumns

//        gameBoardLayout = Array(
//            repeating: Array(
//                repeating: GameBoardSlotView(),
//                count: gameBoard.numberOfColumns
//            ),
//            count: gameBoard.numberOfRows
//        )

//        let count = CGFloat(cols)
//        slotSize = (frame.size.width - CGFloat((count-1) * spacing)) / CGFloat(count)

//        for r in 0 ..< gameBoard.numberOfRows {
//            for c in 0 ..< gameBoard.numberOfColumns {
//                let slotView = GameBoardSlotView()
//                gameBoardLayout[r][c] = slotView
//                slotView.row = r
//                slotView.col = c
//                addSubview(slotView)
//            }
//        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: heightAnchor, multiplier: 7/6)
            ])

        let verticalStack = UIStackView()
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .horizontal
        verticalStack.distribution = .fillEqually
        addSubview(verticalStack)

        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: topAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor)
            ])

        
        for c in 0 ..< columns {
            let column = UIStackView()
            column.translatesAutoresizingMaskIntoConstraints = false
            column.distribution = .fillEqually
            column.axis = .vertical
            column.tag = c
            verticalStack.addArrangedSubview(column)
            for r in 0 ..< rows {
                let slot = UIGameBoardSlot()
                slot.translatesAutoresizingMaskIntoConstraints = false
                slot.tag = r
                slot.backgroundColor = .gray
                slot.titleLabel?.text = String(r)
                column.addArrangedSubview(slot)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        let rows = gameBoard.numberOfRows
//        let cols = gameBoard.numberOfColumns
        
//        var slotFrame = CGRect(x: 0, y: 0, width: slotSize, height: slotSize)
        
//        for r in 0 ..< rows {
//            for c in 0 ..< cols {
//                let slotView = gameBoardLayout[r][c]
//                slotFrame.origin.x = CGFloat(c) * (slotSize + spacing)
//                slotFrame.origin.y = (CGFloat(rows - 1) - CGFloat(r)) * (slotSize + spacing)
//                slotView.frame = slotFrame
//                slotView.textLabel.text = "\(slotView.row!),\(slotView.col!)"
//            }
//        }
    }
}
