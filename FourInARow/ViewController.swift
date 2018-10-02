//
//  ViewController.swift
//  FourInARow
//
//  Created by Adland Lee on 8/15/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameBoardView: UIGameBoardView!
    
    
    // MARK:- Properties
    
    weak var currentGameBoardSlot: UIGameBoardSlot?
    
    let normalColor = UIColor.gray
    let player1Color = UIColor.red
    let player2Color = UIColor.yellow

    
    // MARK:- View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longPressGestureOnGameboard = UILongPressGestureRecognizer(
            target: self,
            action: #selector(handleLongPress(_:))
        )
        longPressGestureOnGameboard.minimumPressDuration = 0
        gameBoardView.addGestureRecognizer(longPressGestureOnGameboard)
    }

    override func viewDidLayoutSubviews() {
        for button in view.allSubviews {
            guard button is UIGameBoardSlot else {
                continue
            }
            button.backgroundColor = normalColor
        }
    }

    
    // MARK:- Gestures
    
    @objc
    func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        let touchPoint = gesture.location(in: view)
        let targetView = view.hitTest(touchPoint, with: nil)
        
            switch gesture.state {
            case .began:
                currentGameBoardSlot = targetView as? UIGameBoardSlot
                currentGameBoardSlot?.superview?.superview?.backgroundColor = .purple
            case .changed:
                if targetView is UIGameBoardSlot && currentGameBoardSlot == nil {
                    currentGameBoardSlot = targetView as? UIGameBoardSlot
                    currentGameBoardSlot?.superview?.superview?.backgroundColor = .purple
                }
                if currentGameBoardSlot != nil && !currentGameBoardSlot!.isEqual(targetView) {
                    currentGameBoardSlot?.superview?.superview?.backgroundColor = .clear
                    currentGameBoardSlot = nil
                }
            case .ended, .cancelled:
                if let rowTag = currentGameBoardSlot?.tag, let colTag = currentGameBoardSlot?.superview!.tag {
                    print("end: c:\(colTag), r:\(rowTag)")
                }
                currentGameBoardSlot?.superview?.superview?.backgroundColor = .clear
                currentGameBoardSlot = nil
            default:
                print("gesture state not implemented")
            }
    }
    
    func setSlotColor(slot: UIGameBoardSlot, color: UIColor) {
        gameBoardView.setColor(for: slot, with: color)
        let position = gameBoardView.getPlayPosition(for: slot)
    }
    
}
