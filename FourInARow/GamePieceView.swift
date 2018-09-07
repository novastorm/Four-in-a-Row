//
//  GamePieceView.swift
//  FourInARow
//
//  Created by Adland Lee on 9/1/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

class GamePieceView: UIView {
    
    var color: UIColor!
    
    lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "R,C"
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    override init(frame: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(color: UIColor, size: CGFloat) {
        self.color = color
        super.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
        backgroundColor = color
        layer.cornerRadius = size/2
    }
    
    private func setupView() {
        addSubview(textLabel)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
}
