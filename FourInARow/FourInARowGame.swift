//
//  GameBoard.swift
//  FourInARow
//
//  Created by Adland Lee on 9/1/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

enum GameBoardSlot: String {
    case none, one, two
}

typealias PlayPosition = FourInARowVector2D
typealias FourInARowGameBoard = [[GameBoardSlot]]

extension Array where Element == [GameBoardSlot] {
    var description:String {
        var result = ""
        for r in stride(from: 5, through: 0, by: -1) {
            for c in 0 ... 6 {
                var chip: String
                switch self[r][c] {
                case .one:
                    chip = "X"
                case .two:
                    chip = "O"
                default:
                    chip = " "
                }
                result += "[\(chip)]"
            }
            result += "\n"
        }
        return result
    }
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

class FourInARowGame {
    
    let numberOfRows = 6
    let numberOfColumns = 7
    var board: FourInARowGameBoard
    var isGameOver: Bool
    
    init() {
        
        board = Array(
            repeating: Array(
                repeating: GameBoardSlot.none,
                count: numberOfColumns),
            count: numberOfRows)
        isGameOver = false
    }
    
    convenience init?(board: FourInARowGameBoard) {
        self.init()
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
        guard let playPosition = insertPiece(for: player, at: column) else {
            return nil
        }

        isGameOver = isGameOver || isWinningPlay(playPosition)

        return playPosition
    }
    
    func insertPiece(for player: GameBoardSlot, at column: Int) -> PlayPosition? {
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
        if !isGameOver
        && (column >= 0)
        && (column < numberOfColumns)
        && (board[numberOfRows-1][column] == .none) {
            return true
        }
        return false
    }
    
    func isWinningPlay(_ playPosition: PlayPosition) -> Bool {
        return isVerticalWin(playPosition)
            || isHorizontalWin(playPosition)
            || isForwardSlashWin(playPosition)
            || isBackSlashWin(playPosition)
    }
    
    func isVerticalWin(_ playPosition: PlayPosition) -> Bool {
        var count = 1
        let row = playPosition.row
        let col = playPosition.col
        let player = board[row][col]
        
        if row >= 3 {
            for i in 1 ... 3 {
                let testPosition = playPosition + (FourInARowDirection.s * i)
                let r = testPosition.row
                let c = testPosition.col

                if player == board[r][c] {
                    count += 1
                }
                else {
                    break
                }
            }
        }
        
        return count == 4
    }
    
    func isHorizontalWin(_ playPosition: PlayPosition) -> Bool {
        var count = 1
        let row = playPosition.row
        let col = playPosition.col
        let player = board[row][col]

        if col > 0 {
            for i in 1 ... min(3, col) {
                let testPosition = playPosition + (FourInARowDirection.w * i)
                let r = testPosition.row
                let c = testPosition.col

                if player == board[r][c] {
                    count += 1
                }
                else {
                    break
                }
            }
        }
        if col < numberOfColumns-1 {
            for i in 1 ... min(3, (numberOfColumns-1) - col) {
                let testPosition = playPosition + (FourInARowDirection.e * i)
                let r = testPosition.row
                let c = testPosition.col

                if player == board[r][c] {
                    count += 1
                }
                else {
                    break
                }
            }
        }
        
        return count == 4
    }
    
    func isForwardSlashWin(_ playPosition: PlayPosition) -> Bool {
        var count = 1
        let row = playPosition.row
        let col = playPosition.col
        let player = board[row][col]
        
        if (col > 0) && (row > 0) {
            for i in 1 ... min(3, col, row) {
                let testPosition = playPosition + (FourInARowDirection.sw * i)
                let r = testPosition.row
                let c = testPosition.col

                if player == board[r][c] {
                    count += 1
                }
                else {
                    break
                }
            }
        }
        if (col < numberOfColumns-1) && (row < numberOfRows-1) {
            for i in 1 ... min(3, numberOfColumns-1 - col, numberOfRows-1 - row) {
                let testPosition = playPosition + (FourInARowDirection.ne * i)
                let r = testPosition.row
                let c = testPosition.col

                if player == board[r][c] {
                    count += 1
                }
                else {
                    break
                }
            }
        }
        
        return count == 4
    }
    
    func isBackSlashWin(_ playPosition: PlayPosition) -> Bool {
        var count = 1
        let row = playPosition.row
        let col = playPosition.col
        let player = board[row][col]
        
        if (col > 0) && (row < numberOfRows-1) {
            for i in 1 ... min(3, col, (numberOfRows-1) - row) {
                let testPosition = playPosition + (FourInARowDirection.nw * i)
                let r = testPosition.row
                let c = testPosition.col

                if player == board[r][c] {
                    count += 1
                }
                else {
                    break
                }
            }
        }
        if (col < numberOfColumns-1) && (row > 0) {
            for i in 1 ... min(3, (numberOfColumns-1) - col, row) {
                let testPosition = playPosition + (FourInARowDirection.se * i)
                let r = testPosition.row
                let c = testPosition.col

                if player == board[r][c] {
                    count += 1
                }
                else {
                    break
                }
            }
        }
        
        return count == 4
    }
}
