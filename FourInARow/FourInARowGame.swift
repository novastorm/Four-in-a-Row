//
//  GameBoard.swift
//  FourInARow
//
//  Created by Adland Lee on 9/1/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

enum GameBoardSlot {
    case none, one, two
}

typealias PlayPosition = Vector2D
typealias FourInARowGameBoard = [[GameBoardSlot]]

/**
 
 Game board coordinates
 
 (rows: Y)
 5
 4
 3
 2
 1
 0
 0 1 2 3 4 5 6 (cols: X)
 
 */

class FourInARowGame {
    let numberOfRows = 6
    let numberOfColumns = 7
    var board: FourInARowGameBoard
    
    init() {
        board = Array(
            repeating: Array(
                repeating: GameBoardSlot.none,
                count: numberOfColumns),
            count: numberOfRows)
    }
    
    init?(board: FourInARowGameBoard) {
        guard board.count == numberOfRows else {
            return nil
        }
        
        self.board = Array<[GameBoardSlot]>(repeating: [], count: numberOfRows)
        
        for (r, row) in board.enumerated() {
            guard row.count == numberOfColumns else {
                return nil
            }
            self.board[r] = Array(repeating: GameBoardSlot.none, count: numberOfColumns)
            for (c, element) in row.enumerated() {
                self.board[r][c] = element
            }
        }
    }
    
    func reset() {
        for r in 0 ..< board.count {
            for c in 0 ..< board[r].count {
                board[r][c] = .none
            }
        }
    }
    
    func playPiece(for player: GameBoardSlot, at column: Int) -> PlayPosition? {
        guard canPlay(at: column) else {
            return nil
        }
        
        for row in 0 ..< numberOfRows {
            if board[row][column] == .none {
                board[row][column] = player
                
                return PlayPosition(row, column)
            }
        }
        
        return nil
    }
    
    func canPlay(at column: Int) -> Bool {
        if (column >= 0)
        && (column < numberOfColumns)
            && (board[numberOfRows-1][column] == .none) {
            return true
        }
        return false
    }
}
