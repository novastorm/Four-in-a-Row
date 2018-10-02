//
//  UIGameBoardColumn.swift
//  FourInARow
//
//  Created by Adland Lee on 10/2/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

@IBDesignable
class UIGameBoardColumn: UIView {

    var stackView: UIStackView {
        return subviews[0] as! UIStackView
    }

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
    }
}
