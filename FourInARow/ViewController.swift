//
//  ViewController.swift
//  FourInARow
//
//  Created by Adland Lee on 8/15/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gamePieceView: GamePieceView!
    @IBOutlet weak var gameBoardView: GameBoardView!
    
    // MARK:- Properties
    
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gameBoard = gameBoardView.gameBoard
        let count = gameBoard.numberOfColumns
        let spacing = gameBoardView.spacing
        let slotSize = (gameBoardView.frame.width - CGFloat(count-1) * spacing) / CGFloat(count)

        gamePieceView = GamePieceView(color: .red, size: slotSize)
        view.addSubview(gamePieceView)
        gamePieceView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gamePieceView.widthAnchor.constraint(equalToConstant: slotSize),
            gamePieceView.heightAnchor.constraint(equalTo: gamePieceView.widthAnchor),
            gamePieceView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gamePieceView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 50)
            ])
        
        let longPressOnPiece = UILongPressGestureRecognizer(
            target: self,
            action: #selector(ViewController.handleLongPress(_:)))
        gamePieceView.addGestureRecognizer(longPressOnPiece)
        
        let touchIndicator = TouchIndicatorGestureRecognizer(target: self, action: nil)
        touchIndicator.delegate = self
        view.addGestureRecognizer(touchIndicator)
    }

    override func viewDidLayoutSubviews() {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK:- Gestures
    
    @objc
    func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        switch gesture.view {
        case let piece as GamePieceView:
            switch gesture.state {
            case .began:
                grabGamePiece(piece, withGesture: gesture)
            case .changed:
                moveGamePiece(piece, withGesture: gesture)
            case .ended, .cancelled:
                dropGamePiece(piece, withGesture: gesture)
            default:
                print("gesture state not implemented")
            }
        case let slot as GameBoardSlotView:
            print("Slot pressed \(slot.row!), \(slot.col!)")
        default:
            break
        }
    }
    
    
    // MARK: - Helpers

    func grabGamePiece(_ piece: UIView, withGesture gesture: UIGestureRecognizer) {
        piece.center = view.convert(piece.center, from: piece.superview)
        view.addSubview(piece)
        
        UIView.animate(withDuration: 0.2) {
            piece.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            piece.alpha = 0.8
            self.moveGamePiece(piece, withGesture: gesture)
        }
    }
    
    func moveGamePiece(_ piece: UIView, withGesture gesture: UIGestureRecognizer) {
        piece.center = gesture.location(in: view)
    }
    
    func dropGamePiece(_ piece: UIView, withGesture gesture: UIGestureRecognizer) {
        UIView.animate(withDuration: 0.2) {
            piece.transform = CGAffineTransform.identity
            piece.alpha = 1.0
        }
        
        piece.center = view.convert(piece.center, to: piece.superview)
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // we should be specific here because it's easy source of bugs
        // but in this example we do want that all of the gestures (long press, pan, indicator) to work simultaneously
        // so it's possible to move the dots with multiple fingers, and open drawer with other finger at the same time
        return true
    }
}
