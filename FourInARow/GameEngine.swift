//
//  GameEngine.swift
//  FourInARow
//
//  Created by Adland Lee on 8/15/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation
import UIKit

struct Player: Equatable {
    typealias IdType = Int
    typealias ChipColorType = UIColor
    
    var id: IdType
    var chipColor: ChipColorType
}

enum PlayerPosition: Int {
    case one=0, two=1
}

typealias FourInARowPlay = Int
typealias PlayPosition = Vector

class Vector: Equatable {

    var x: Int
    var y: Int

    init(_ x: Int , _ y: Int) {
        self.x = x
        self.y = y
    }
    
    static func == (lhs: Vector, rhs: Vector) -> Bool {
        return lhs.x == rhs.x
            && lhs.y == rhs.y
    }
    
    static func != (lhs: Vector, rhs: Vector) -> Bool {
        return !(lhs == rhs)
    }

    static func == (lhs: Vector, rhs: (x:Int, y:Int)) -> Bool {
        return lhs.x == rhs.x
            && lhs.y == rhs.y
    }
    static func != (lhs: Vector, rhs: (x:Int, y:Int)) -> Bool {
        return !(lhs == rhs)
    }

    static func == (lhs: (x:Int, y:Int), rhs: Vector) -> Bool {
        return lhs.x == rhs.x
            && lhs.y == rhs.y
    }
    static func != (lhs: (x:Int, y:Int), rhs: Vector) -> Bool {
        return !(lhs == rhs)
    }

    static func * (lhs: Vector, factor: Int) -> Vector {
        return Vector(lhs.x * factor, lhs.y * factor)
    }
    
    static func + (lhs: Vector, rhs: Vector) -> Vector {
        return Vector(lhs.x + rhs.x, lhs.y + rhs.y)
    }
    
    static func + (lhs: Vector, addend: Int) -> Vector {
        return Vector(lhs.x + addend, lhs.y + addend)
    }
}

class Direction: Vector {
    static let none = Direction( 0,  0)
    
    static let n    = Direction( 0, -1)
    static let ne   = Direction( 1, -1)
    static let e    = Direction( 1,  0)
    static let se   = Direction( 1,  1)
    static let s    = Direction( 0,  1)
    static let sw   = Direction(-1,  1)
    static let w    = Direction(-1,  0)
    static let nw   = Direction(-1, -1)
}

struct GameBoardSlot: Equatable {
    var player: Player?
    
    static func == (lhs: GameBoardSlot, rhs: GameBoardSlot) -> Bool {
        if lhs.player == nil && rhs.player == nil {
            return true
        }
        if lhs.player == nil || rhs.player == nil {
            return false
        }
        return lhs.player! == rhs.player!
    }
}

/**
 
 Game board coordinates
 
 Y
 5
 4
 3
 2
 1
 0
  0 1 2 3 4 5 6 X
 
 
 */
typealias GameBoard = [[GameBoardSlot]]

func == (lhs: GameBoard, rhs: GameBoard) -> Bool {
    for i in 0 ..< lhs.count {
        for j in 0 ..< lhs[i].count {
            if lhs[i][j] != rhs[i][j] {
                return false
            }
        }
    }
    return true
}

class GameEngine {
    
    let xMax = 7
    let yMax = 6
    
    var gameBoard: GameBoard
    var playList: [Player?]
    
    var currentPlayerInt: Player.IdType!
    
    init() {
        gameBoard = Array(
            repeating: Array(
                repeating: GameBoardSlot(player: nil),
                count: xMax),
            count: yMax)
        playList = Array<Player?>(
            repeating: nil,
            count: 2)
    }
    
    func configurePlayer(_ player: Player?, at position: PlayerPosition) {
        playList[position.rawValue] = player
    }
    
    func resetGameBoard() {
        for i in 0 ..< yMax {
            for j in 0 ..< yMax {
                gameBoard[i][j].player = nil
            }
        }
    }
    
    func canPlay(_ col: Int) -> Bool {
        
        let x = col
        
        if (x >= 0)
        && (x < xMax)
        && (gameBoard[x][yMax].player == nil) {
            return true
        }
        
        return false
    }
    
    func placePlay(for player: Player, at col: Int) -> PlayPosition? {
        
        let x = col
        guard canPlay(col) else {
            return nil
        }
        
        for y in 0 ..< yMax {
            if gameBoard[y][x].player == nil {
                gameBoard[y][x].player = player
                
                return PlayPosition(y, x)
            }
        }
        
        return nil
    }
    
    func didPlayerWin(with position: PlayPosition) -> Bool {
        // check from played piece
        var count = 1
        // check for vertical wins '|'
        if position.y > 3 {
            for i in 1 ... 3 {
                print(position + Direction.s * i)
            }
        }
        // check for horizontal wins '-'
        // check for diagonal top left to bottom right '\'
        // check for diagonal top right to bottom left '/'
        return false
    }
    
}
