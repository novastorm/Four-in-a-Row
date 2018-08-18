//
//  GameEngine.swift
//  FourInARow
//
//  Created by Adland Lee on 8/15/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation
import UIKit

struct Player {
    var id: Int
    var chipColor: UIColor
}

struct FourInARowPlay {
    var player: Player
    var column: Int
}

struct PlayPosition {
    var row: Int
    var col: Int
}

struct GameboardSlot{
    var player: Player?
}

typealias GameBoard = [[GameboardSlot]]

class GameEngine {
    
    let rowMin = 0
    let rowMax = 5
    let colMin = 0
    let colMax = 6
    
    var gameBoard: GameBoard = Array(repeating: Array(repeating: GameboardSlot(player: nil), count: 7), count: 6)
    var currentPlayer: Int?
    
    
    
    func placeGamePiece(_ play:FourInARowPlay) {
        // check for legal move
        guard let position = placePlay(play) else {
            // notify if not legal move
            print("Move not legal")
            return
        }
        
        if didPlayerWin(with: position) {
            // send win notification
        }
        // send notification of updated gameboard
    }
    
    func canPlay(_ play:FourInARowPlay) -> Bool {
        let playColumn = play.column
        
        if (playColumn >= colMin)
        && (playColumn <= colMax)
        && (gameBoard[playColumn][rowMax].player == nil) {
            return true
        }
        
        return false
    }
    
    func placePlay(_ play: FourInARowPlay) -> PlayPosition? {
        
        guard canPlay(play) else {
            return nil
        }
        
        let col = play.column
        var row: Int? = nil
        
        for r in 0 ... rowMax {
            if gameBoard[r][col].player == nil {
                gameBoard[r][col].player = play.player
                row = r
                return PlayPosition(row: row!, col:col)
            }
        }
        
        return nil
    }
    
    func didPlayerWin(with position:PlayPosition) -> Bool {
        // check from played piece
        // check for vertical wins '|'
        // check for horizontal wins '-'
        // check for diagonal top left to bottom right '\'
        // check for diagonal top right to bottom left '/'
        return false
    }
}
