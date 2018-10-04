//
//  ViewController.swift
//  FourInARow
//
//  Created by Adland Lee on 8/15/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit
import FontAwesomeSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var currentPlayerButton: UIGameBoardSlot!
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
        
        resetButton.setFAIcon(icon: .FARefresh, iconSize: 50, forState: .normal)
        fourInARowGame.delegate = self
    }

    override func viewDidLayoutSubviews() {
        for button in view.allSubviews {
            guard button is UIGameBoardSlot else {
                continue
            }
            button.backgroundColor = playerColor[.none]
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resetGame(self)
    }

    // MARK: - Actions
    
    @IBAction func resetGame(_ sender: Any) {
        fourInARowGame.reset()
        gameBoardView.setAllSlotColors(to: playerColor[.none]!)
    }

    
    // MARK:- Gestures
    
    @objc
    func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        
        guard !fourInARowGame.isGameOver else {
            return
        }
        
        let touchPoint = gesture.location(in: view)
        let targetView = view.hitTest(touchPoint, with: nil)
        

        switch gesture.state {
        case .began:
            if let targetColumn = (targetView?.superview?.superview as? UIGameBoardColumn) {
                currentGameBoardColumn = targetColumn
            }
            currentGameBoardColumn?.backgroundColor = .purple
        case .changed:
            if let targetColumn = (targetView?.superview?.superview as? UIGameBoardColumn) {
                if currentGameBoardColumn == nil {
                    currentGameBoardColumn = targetColumn
                    currentGameBoardColumn?.backgroundColor = .purple
                }
                if currentGameBoardColumn != nil && !currentGameBoardColumn!.isEqual(targetColumn) {
                    currentGameBoardColumn!.backgroundColor = .clear
                    currentGameBoardColumn = nil
                }
            }
        case .failed:
            print("gesture failed")
        case .ended:
            print("gesture ended")
            if let targetColumn = (targetView?.superview?.superview as? UIGameBoardColumn) {
                playPiece(in: targetColumn.stackView.tag, for: currentPlayer)
            }
            currentGameBoardColumn?.backgroundColor = .clear
            currentGameBoardColumn = nil
        case .cancelled:
            print("gesture cancelled")
            currentGameBoardColumn?.backgroundColor = .clear
            currentGameBoardColumn = nil
        default:
            print("gesture state not implemented")
        }
    }
    
    func playPiece(in column: Int, for player: Player) {
        guard let playPosition = fourInARowGame.playPiece(at: column, for: player) else {
            print("Cannot play piece in column")
            return
        }
        let slot = gameBoardView.getGameBoardSlot(for: playPosition)
        slot.backgroundColor = playerColor[player]
        
        if fourInARowGame.isGameOver {
            print("player \(player.rawValue) wins")
        }
    }
    
//    func setSlotColor(slot: UIGameBoardSlot, color: UIColor) {
//        gameBoardView.setSlotPieceColor(for: slot, with: color)
//        let position = gameBoardView.getPlayPosition(for: slot)
//    }
    
    private func printSlot(_ slot: UIGameBoardSlot) {
        let rowTag = slot.tag
        let colTag = slot.superview!.tag
        
        print("end: c:\(colTag), r:\(rowTag)")

    }
}

extension ViewController: FourInARowGameDelegate {

    func didSetCurrentPlayer(_ player: Player) {
        currentPlayer = player
        currentPlayerButton.backgroundColor = playerColor[player]
    }
}
