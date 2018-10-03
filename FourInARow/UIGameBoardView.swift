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
            for view in horizontalStack.arrangedSubviews as! [UIGameBoardColumn] {
                view.stackView.spacing = spacing
            }
            updateView()
        }
    }
    
    @IBInspectable
    var rows: Int = 6 {
        didSet {
            setupViews()
        }
    }
    
    @IBInspectable
    var columns: Int = 7 {
        didSet {
            setupViews()
        }
    }

    
//    var gameBoardLayout = [[GameBoardSlotView]]()
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
        
        if horizontalStack != nil {
            for aView in horizontalStack.subviews {
                aView.removeFromSuperview()
            }
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: 7/6).isActive = true

        horizontalStack = UIStackView(frame: frame)
        addSubview(horizontalStack)
        
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fillEqually
        horizontalStack.spacing = spacing

        horizontalStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        for c in 0 ..< columns {
            let columnView = UIGameBoardColumn()
            horizontalStack.addArrangedSubview(columnView)
            columnView.translatesAutoresizingMaskIntoConstraints = false

            let columnStack = UIStackView()
            columnView.addSubview(columnStack)
            columnStack.translatesAutoresizingMaskIntoConstraints = false

            columnStack.axis = .vertical
            columnStack.distribution = .fillEqually
            columnStack.tag = c
            columnStack.spacing = spacing

            columnStack.topAnchor.constraint(equalTo: columnView.topAnchor).isActive = true
            columnStack.trailingAnchor.constraint(equalTo: columnView.trailingAnchor).isActive = true
            columnStack.bottomAnchor.constraint(equalTo: columnView.bottomAnchor).isActive = true
            columnStack.leadingAnchor.constraint(equalTo: columnView.leadingAnchor).isActive = true
            
            for r in 0 ..< rows {
                let slot = UIGameBoardSlot()
                slot.translatesAutoresizingMaskIntoConstraints = false
                columnStack.addArrangedSubview(slot)
                slot.tag = r
                slot.backgroundColor = .gray
            }
        }
    }
    
    func getGameBoardSlot(for playPosition: PlayPosition) -> UIGameBoardSlot {
        let r = playPosition.row
        let c = playPosition.col
        
        let column = horizontalStack.arrangedSubviews[c] as! UIGameBoardColumn
        
        return column.stackView.arrangedSubviews[r] as! UIGameBoardSlot
    }
    
    func getGameBoardColumn(for slot: UIGameBoardSlot) -> UIGameBoardColumn {
        
        return slot.superview?.superview as! UIGameBoardColumn
    }

    func getGameBoardColumn(_ c: Int) -> UIGameBoardColumn {
        return horizontalStack.arrangedSubviews[c].subviews[0] as! UIGameBoardColumn
        
    }

    func getColumnNumber(for slot: UIGameBoardSlot) -> Int {
        return slot.superview!.tag
    }
    
    func getPlayPosition(for slot: UIGameBoardSlot) -> (r: Int, c: Int) {
        let c = slot.tag
        let r = slot.superview!.tag
        
        return (r: r, c: c)
    }
    
    func setColumnColor(for column: UIGameBoardColumn, with color: UIColor) {
        column.backgroundColor = color
    }

    func setColumnColor(for slot: UIGameBoardSlot, with color: UIColor) {
        slot.superview?.superview?.backgroundColor = color
    }
    
    func setSlotPieceColor(for slot: UIGameBoardSlot, with color: UIColor) {
        slot.backgroundColor = color
    }
    
    func setAllSlotColors(to color: UIColor) {
        for view in horizontalStack.arrangedSubviews as! [UIGameBoardColumn] {
            for slot in view.stackView.arrangedSubviews as! [UIGameBoardSlot] {
                slot.backgroundColor = color
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
