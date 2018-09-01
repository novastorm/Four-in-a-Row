//
//  GameEngineTests.swift
//  FourInARowTests
//
//  Created by Adland Lee on 8/17/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import XCTest

//@testable import FourInARow

class GameEngineTests: XCTestCase {
    
//    var playerList: [Player]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        playerList = [
//            Player(id: 0, chipColor: .red),
//            Player(id: 1, chipColor: .yellow)
//        ]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testPlaceGamePiece() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        let gameEngine = GameEngine()
//        var targetGameBoard = Array(
//            repeating: Array(
//                repeating: GameBoardSlot(player: nil),
//                count: 7),
//            count: 6)
//
//        var player: Player
//        var position: PlayPosition?
//
//        // Verify initial gameboard state
//        XCTAssert(gameEngine.gameBoard == targetGameBoard, "game board does not match target")
//
//        var testColumn: Int
//
//        testColumn = 3
//        for i in 0 ... 5 {
//            let playerIndex = i % 2
//            player = playerList[playerIndex]
////            play = FourInARowPlay(player: player, column: testColumn)
//            position = gameEngine.placePlay(for: player, at: testColumn)
//            XCTAssertNotNil(position, "position should contain a value")
//            if let position = position {
//                let targetPosition = (x: i, y: testColumn)
//                XCTAssert(position == targetPosition, "position should be at: \(targetPosition)")
//                targetGameBoard[targetPosition.x][targetPosition.y].player = player
//                XCTAssert(
//                    gameEngine.gameBoard == targetGameBoard,
//                    "game board does not match target\ntarget:\n\(getGameboardDescription(targetGameBoard))\nactual:\n\(getGameboardDescription(gameEngine.gameBoard))\n"
//                )
//            }
//        }
//
//        player = playerList[0]
//        position = gameEngine.placePlay(for: player, at: testColumn)
//        XCTAssertNil(position, "Play should have yielded a nil position")
//
//        testColumn = 4
//        position = gameEngine.placePlay(for: player, at: testColumn)
//        XCTAssertNotNil(position, "position should contain a value")
//        if let position = position {
//            let targetPosition = (x: 0, y: 4)
//            XCTAssert(position == targetPosition, "position should be at: \(targetPosition)")
//            targetGameBoard[targetPosition.x][targetPosition.y].player = player
//            XCTAssert(
//                gameEngine.gameBoard == targetGameBoard,
//                "game board does not match target\ntarget:\n\(getGameboardDescription(targetGameBoard))\nactual:\n\(getGameboardDescription(gameEngine.gameBoard))\n"
//            )
//        }
//    }
    
//    func testWinConditions() {
//        let gameEngine = GameEngine()
//        var player: Player
//        var play: FourInARowPlay
//        var position: PlayPosition?
//
//    }
    
//    func getGameboardDescription(_ gameBoard: GameBoard) -> String {
//        var result = ""
//        for r in stride(from: 5, through: 0, by: -1) {
//            for c in 0 ... 6 {
//                var chip: String
//                switch gameBoard[r][c].player {
//                case playerList[0]:
//                    chip = "X"
//                case playerList[1]:
//                    chip = "O"
//                default:
//                    chip = " "
//                }
//                result += "[\(chip)]"
//            }
//            result += "\n"
//        }
//        return result
//    }
    
    func testExample() {
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
