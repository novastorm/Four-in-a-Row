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
    var spacing: CGFloat = 2 {
        didSet {
            horizontalStack.spacing = spacing
            for col in horizontalStack.arrangedSubviews {
                if let col = col as? UIStackView {
                    col.spacing = spacing
                }
                
            }
            updateView()
        }
    }
    
    @IBInspectable
    var rows: Int = 6
    
    @IBInspectable
    var columns: Int = 7
    
    
//    var gameBoardLayout = [[GameBoardSlotView]]()
    var slotSize: CGFloat!
    var gamePieces = [[GamePieceView]]()
    var horizontalStack: UIStackView!
    
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
        translatesAutoresizingMaskIntoConstraints = true
    }
    
    func sharedInit() {
        setupViews()
        updateView()
    }
    
    func updateView() {
        setNeedsDisplay()
    }
    
    private func setupViews() {
        
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: 7/6).isActive = true

        horizontalStack = UIStackView(frame: frame)
        addSubview(horizontalStack)
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fillEqually

        horizontalStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true

        
        for c in 0 ..< columns {
            let column = UIStackView()
            column.translatesAutoresizingMaskIntoConstraints = false
            column.distribution = .fillEqually
            column.axis = .vertical
            column.tag = c
            horizontalStack.addArrangedSubview(column)
            for r in 0 ..< rows {
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
