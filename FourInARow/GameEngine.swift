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


//class GameEngine {
//
//    let xMax = 7
//    let yMax = 6
//
//    var gameBoard: GameBoard
//    var playList: [Player?]
//
//    var currentPlayerInt: Player.IdType!
//
//    init() {
//        gameBoard = Array(
//            repeating: Array(
//                repeating: GameBoardSlot(player: nil),
//                count: xMax),
//            count: yMax)
//        playList = Array<Player?>(
//            repeating: nil,
//            count: 2)
//    }
//
//    func configurePlayer(_ player: Player?, at position: PlayerPosition) {
//        playList[position.rawValue] = player
//    }
//
//    func resetGameBoard() {
//        for i in 0 ..< yMax {
//            for j in 0 ..< yMax {
//                gameBoard[i][j].player = nil
//            }
//        }
//    }
//
//    func canPlay(_ col: Int) -> Bool {
//
//        let x = col
//
//        if (x >= 0)
//        && (x < xMax)
//        && (gameBoard[x][yMax].player == nil) {
//            return true
//        }
//
//        return false
//    }
//
//    func placePlay(for player: Player, at col: Int) -> PlayPosition? {
//
//        let x = col
//        guard canPlay(col) else {
//            return nil
//        }
//
//        for y in 0 ..< yMax {
//            if gameBoard[y][x].player == nil {
//                gameBoard[y][x].player = player
//
//                return PlayPosition(y, x)
//            }
//        }
//
//        return nil
//    }
//
//    func didPlayerWin(with position: PlayPosition) -> Bool {
//        // check from played piece
//        var count = 1
//        // check for vertical wins '|'
//        if position.y > 3 {
//            for i in 1 ... 3 {
//                print(position + Direction.s * i)
//            }
//        }
//        // check for horizontal wins '-'
//        // check for diagonal top left to bottom right '\'
//        // check for diagonal top right to bottom left '/'
//        return false
//    }
//
//}
