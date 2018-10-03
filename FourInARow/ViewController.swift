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
    var fourInARowGame = FourInARowGame()
    
    // MARK:- Properties
    
    var currentPlayer: Player = .one
    weak var currentGameBoardColumn: UIGameBoardColumn?
    
    let playerColor: [Player: UIColor] = [
        .none: .gray,
        .one: .red,
        .two: .yellow
    ]

    
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
            button.backgroundColor = playerColor[.none]
        }
    }

    
    // MARK:- Gestures
    
    @objc
    func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        let touchPoint = gesture.location(in: view)
        let targetView = view.hitTest(touchPoint, with: nil)
        
        if let targetColumn = (targetView?.superview?.superview as? UIGameBoardColumn) {

            switch gesture.state {
            case .began:
                currentGameBoardColumn = targetColumn
                currentGameBoardColumn?.backgroundColor = .purple
            case .changed:
                if currentGameBoardColumn == nil {
                    currentGameBoardColumn = targetColumn
                    currentGameBoardColumn!.backgroundColor = .purple
                }
                if currentGameBoardColumn != nil && !currentGameBoardColumn!.isEqual(targetColumn) {
                    currentGameBoardColumn!.backgroundColor = .clear
                    
                    currentGameBoardColumn = nil
                }
            case .ended, .cancelled:
                if let targetView = targetView as? UIGameBoardSlot {
                    let c = currentGameBoardColumn!.stackView.tag
                    printSlot(targetView)
                    playPiece(in: c, for: currentPlayer)
                }
                currentGameBoardColumn?.backgroundColor = .clear

                currentGameBoardColumn = nil
            default:
                print("gesture state not implemented")
            }
        }
    }
    
    func playPiece(in column: Int, for player: Player) {
        fourInARowGame.playPiece(at: column, for: player)
        
    }
    
    func setSlotColor(slot: UIGameBoardSlot, color: UIColor) {
        gameBoardView.setSlotPieceColor(for: slot, with: color)
        let position = gameBoardView.getPlayPosition(for: slot)
    }
    
    private func printSlot(_ slot: UIGameBoardSlot) {
        let rowTag = slot.tag
        let colTag = slot.superview!.tag
        
        print("end: c:\(colTag), r:\(rowTag)")

    }
}
