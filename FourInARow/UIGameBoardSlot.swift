//
//  GameBoardSlotUIControl.swift
//  FourInARow
//
//  Created by Adland Lee on 9/1/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

@IBDesignable
class UIGameBoardSlot: UIButton {
    
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
    }
    
    func updateView() {
        setNeedsDisplay()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius: CGFloat = min(bounds.width, bounds.height) / 2.0
        layer.cornerRadius = radius
    }
}
