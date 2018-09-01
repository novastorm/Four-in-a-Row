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

class GameBoard {
    let numberOfRows = 6
    let numberOfColumns = 7
    var board: [[GameBoardSlot]]
    
    init() {
        board = Array(
            repeating: Array(
                repeating: GameBoardSlot.none,
                count: numberOfColumns),
            count: numberOfRows)
    }
    
    init?(board: [[GameBoardSlot]]) {
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
    
    
}

extension GameBoard {
    static func == (lhs: GameBoard, rhs: GameBoard) -> Bool {
        for i in 0 ..< lhs.board.count {
            for j in 0 ..< lhs.board[i].count {
                if lhs.board[i][j] != rhs.board[i][j] {
                    return false
                }
            }
        }
        return true
    }
}
