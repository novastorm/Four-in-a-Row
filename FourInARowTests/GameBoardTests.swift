//
//  GameBoardTests.swift
//  FourInARowTests
//
//  Created by Adland Lee on 9/1/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import XCTest

@testable import FourInARow

class GameBoardTests: XCTestCase {
    
    let numRows = 6
    let numCols = 7

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_gameBoard_initWithBoard() {
        
        var targetGameBoard = Array(
            repeating: Array(
                repeating: GameBoardSlot.none,
                count: numCols),
            count: numRows
        )
        
        targetGameBoard[0][4] = .one
        
        guard let gameBoard = FourInARowGame(board: targetGameBoard) else {
            assertionFailure("Game Board should not be nil")
            return
        }

        targetGameBoard[0][4] = .none
        gameBoard.reset()

        XCTAssert(gameBoard.board == targetGameBoard, "Initialized Game Board does not match target.")
    }
    
    func test_playPiece() {
        
        var targetGameBoard = Array(
            repeating: Array(
                repeating: GameBoardSlot.none,
                count: numCols),
            count: numRows
        )
        
        let gameBoard = FourInARowGame()

        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[0][3] = .one

        guard gameBoard.board == targetGameBoard else {
            XCTFail("Game Board does not match target.")
            print(getGameboardDescription(gameBoard.board))
            print(getGameboardDescription(targetGameBoard))
            return
        }

        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[1][3] = .one

        guard gameBoard.board == targetGameBoard else {
            XCTFail("Game Board does not match target.")
            print(getGameboardDescription(gameBoard.board))
            print(getGameboardDescription(targetGameBoard))
            return
        }

        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[2][3] = .one
        
        guard gameBoard.board == targetGameBoard else {
            XCTFail("Game Board does not match target.")
            print(getGameboardDescription(gameBoard.board))
            print(getGameboardDescription(targetGameBoard))
            return
        }

        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[3][3] = .one
        
        guard gameBoard.board == targetGameBoard else {
            XCTFail("Game Board does not match target.")
            print(getGameboardDescription(gameBoard.board))
            print(getGameboardDescription(targetGameBoard))
            return
        }

        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[4][3] = .one
        
        guard gameBoard.board == targetGameBoard else {
            XCTFail("Game Board does not match target.")
            print(getGameboardDescription(gameBoard.board))
            print(getGameboardDescription(targetGameBoard))
            return
        }

        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[5][3] = .one
        
        guard gameBoard.board == targetGameBoard else {
            XCTFail("Game Board does not match target.")
            print(getGameboardDescription(gameBoard.board))
            print(getGameboardDescription(targetGameBoard))
            return
        }

        let playPosition = gameBoard.playPiece(for: .one, at: 3)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }

    func getGameboardDescription(_ gameBoard: FourInARowGameBoard) -> String {
        var result = ""
        for r in stride(from: 5, through: 0, by: -1) {
            for c in 0 ... 6 {
                var chip: String
                switch gameBoard[r][c] {
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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
