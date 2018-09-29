//
//  GameBoardSlotUIControl.swift
//  FourInARow
//
//  Created by Adland Lee on 9/1/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

@IBDesignable
class GameBoardSlotUIControl: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius: CGFloat = bounds.height / 2.0
        layer.cornerRadius = radius
    }
}
