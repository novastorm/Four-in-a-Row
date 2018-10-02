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
            let columnView = UIView()
            horizontalStack.addArrangedSubview(columnView)
            columnView.translatesAutoresizingMaskIntoConstraints = false

            let columnStack = UIStackView()
            columnView.addSubview(columnStack)
            columnStack.translatesAutoresizingMaskIntoConstraints = false

            columnStack.axis = .vertical
            columnStack.distribution = .fillEqually
            columnStack.tag = c

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
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
