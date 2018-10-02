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
            action: #selector(handleLongPress(_:)))
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
//                currentGameBoardSlot?.backgroundColor = player1Color
                currentGameBoardSlot?.superview?.superview?.backgroundColor = .purple
            case .changed:
                if targetView is UIGameBoardSlot && currentGameBoardSlot == nil {
                    currentGameBoardSlot = targetView as? UIGameBoardSlot
//                    currentGameBoardSlot?.backgroundColor = player1Color
                    currentGameBoardSlot?.superview?.superview?.backgroundColor = .purple
                }
                if currentGameBoardSlot != nil && !currentGameBoardSlot!.isEqual(targetView) {
//                    currentGameBoardSlot?.backgroundColor = normalColor
                    currentGameBoardSlot?.superview?.superview?.backgroundColor = .clear
                    currentGameBoardSlot = nil
                }
            case .ended, .cancelled:
                if let rowTag = currentGameBoardSlot?.tag, let colTag = currentGameBoardSlot?.superview!.tag {
                    print("end tag: \(rowTag), \(colTag)")
                }
//                currentGameBoardSlot?.backgroundColor = normalColor
                currentGameBoardSlot?.superview?.superview?.backgroundColor = .clear
                currentGameBoardSlot = nil
            default:
                print("gesture state not implemented")
            }
    }
    
    
    // MARK: - Helpers
    @objc
    func handleLongPressOnPiece(_ gesture: UILongPressGestureRecognizer) {
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
        default:
            break
        }
    }
    
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
    
    func grabColumn(_ column: UIView, with gesture: UIGestureRecognizer) {
        
    }
}
