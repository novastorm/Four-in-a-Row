//
//  FourInARowGame.swift
//  FourInARow
//
//  Created by Adland Lee on 9/1/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

enum Player: String {
    case none, one, two
}

typealias PlayPosition = FourInARowVector2D
typealias FourInARowGameBoard = [[Player]]

extension Array where Element == [Player] {
    var description:String {
        var result = ""
        for r in 0 ..< count {
            for c in 0 ..<  self[0].count-1 {
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
 
 0 1 2 3 4 5 6 (cols: X)
 1
 2
 3
 4
 5 (rows: Y)
 
 */

class FourInARowGame {
    
    let numberOfRows = 6
    let numberOfColumns = 7
    var board: FourInARowGameBoard
    var isGameOver: Bool
    
    init() {
        
        board = Array(
            repeating: Array(
                repeating: Player.none,
                count: numberOfColumns),
            count: numberOfRows)
        isGameOver = false
    }
    
    convenience init?(board: FourInARowGameBoard) {
        self.init()
        guard board.count == numberOfRows else {
            return nil
        }
        
        self.board = Array<[Player]>(repeating: [], count: numberOfRows)
        
        for (r, row) in board.enumerated() {
            guard row.count == numberOfColumns else {
                return nil
            }
            self.board[r] = Array(repeating: Player.none, count: numberOfColumns)
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
        isGameOver = false
    }
    
    func playPiece(at column: Int, for player: Player) -> PlayPosition? {
        guard let playPosition = insertPiece(at: column, for: player) else {
            return nil
        }

        isGameOver = isGameOver || isWin(playPosition)

        return playPosition
    }
    
    func insertPiece(at column: Int, for player: Player) -> PlayPosition? {
        guard canPlay(at: column) else {
            return nil
        }
        
        for row in stride(from: numberOfRows-1, through: 0, by: -1) {
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
        && (board[0][column] == .none) {
            return true
        }
        return false
    }
    
    func isWin(_ playPosition: PlayPosition) -> Bool {
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
        
        if row < 3 {
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
        
        return count >= 4
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
        
        return count >= 4
    }
    
    func isBackSlashWin(_ playPosition: PlayPosition) -> Bool {
        var count = 1
        let row = playPosition.row
        let col = playPosition.col
        let player = board[row][col]
        
        if (col > 0) && (row > 0) {
            for i in 1 ... min(3, col, row) {
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
        if (col < numberOfColumns-1) && (row < numberOfRows-1) {
            for i in 1 ... min(3, numberOfColumns-1 - col, numberOfRows-1 - row) {
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
        
        return count >= 4
    }
    
    func isForwardSlashWin(_ playPosition: PlayPosition) -> Bool {
        var count = 1
        let row = playPosition.row
        let col = playPosition.col
        let player = board[row][col]
        
        if (col > 0) && (row < numberOfRows-1) {
            for i in 1 ... min(3, col, numberOfRows-1 - row) {
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
        if (col < numberOfColumns-1) && (row > 0) {
            for i in 1 ... min(3, numberOfColumns-1 - col, row) {
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
        
        return count >= 4
    }
}
