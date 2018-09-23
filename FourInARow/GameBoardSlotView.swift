//
//  GameBoardViewSlot.swift
//  FourInARow
//
//  Created by Adland Lee on 9/1/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

class GameBoardSlotView: UIControl {
    
    var row: Int!
    var col: Int!
    
    lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "r,c"
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .lightGray
        addSubview(textLabel)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        print("begin", touch, event)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        print("continue", touch, event)
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        print("end", touch, event)
    }
    
    override func cancelTracking(with event: UIEvent?) {
        print("cancel", event)
    }
}
