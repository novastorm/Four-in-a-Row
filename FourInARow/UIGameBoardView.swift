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
        setupViews()
        updateView()
    }
    
    func updateView() {
        setNeedsDisplay()
    }
    
    private func setupViews() {
        
        translatesAutoresizingMaskIntoConstraints = true
        
        addConstraints([
            widthAnchor.constraint(equalTo: heightAnchor, multiplier: 7/6)
            ])

        let horizontalStack = UIStackView()
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fillEqually
        addSubview(horizontalStack)

        addConstraints([
            horizontalStack.topAnchor.constraint(equalTo: topAnchor),
            horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor)
            ])

        
        for c in 0 ..< columns {
            let column = UIStackView()
            column.translatesAutoresizingMaskIntoConstraints = false
            column.distribution = .fillEqually
            column.axis = .vertical
            column.tag = c
            horizontalStack.addArrangedSubview(column)
            for r in stride(from: rows-1, through: 0, by: -1) {
                let slot = UIGameBoardSlot()
                slot.translatesAutoresizingMaskIntoConstraints = false
                slot.tag = r
                slot.backgroundColor = .gray
                slot.setTitle(String(r), for: .normal)
                column.addArrangedSubview(slot)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
