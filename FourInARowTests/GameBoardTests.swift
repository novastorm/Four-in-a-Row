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
    var targetGameBoard: FourInARowGameBoard!
    var gameBoard: FourInARowGame!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        targetGameBoard = Array(
            repeating: Array(
                repeating: Player.none,
                count: numCols),
            count: numRows
        )

        gameBoard = FourInARowGame()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_resetBoard() {
        
        let _ = gameBoard.playPiece(at: 0, for: .one)
        targetGameBoard[5][0] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        gameBoard.reset()
        targetGameBoard[5][0] = .none

        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
    }
    
    func test_fillBoard() {
        
        var slot = Player.none
        
        for r in stride(from: numRows-1, through: 0, by: -1) {
            for c in 0 ..< numCols {
                if (r % 2 == 0 && c % 3 == 0) || (r % 2 != 0 && c % 3 != 0) {
                    slot = .one
                }
                else {
                    slot = .two
                }
                let _ = gameBoard.playPiece(at: c, for: slot)
                targetGameBoard[r][c] = slot
                XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
            }
        }
        print("Game Board and target\n\(gameBoard.board.description)\n\(targetGameBoard.description)")
        for c in 0 ..< numCols {
            let playPosition = gameBoard.playPiece(at: c, for: .one)
            XCTAssertNil(playPosition, "playPosition at:\(c) should be nil")
        }
    }

    func test_playPieceVertical() {

        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[5][3] = .one

        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[4][3] = .two

        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[3][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[2][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[1][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[0][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(at: 3, for: .one)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }
    
    func test_playPieceHorizontal() {
        
        let _ = gameBoard.playPiece(at: 0, for: .one)
        targetGameBoard[5][0] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 1, for: .two)
        targetGameBoard[5][1] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 2, for: .one)
        targetGameBoard[5][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[5][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .one)
        targetGameBoard[5][4] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 5, for: .two)
        targetGameBoard[5][5] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 6, for: .two)
        targetGameBoard[5][6] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(at: 7, for: .one)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }

    func test_verticalWin0123() {
        
        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[5][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[4][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[3][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[2][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(at: 3, for: .one)
        XCTAssertNil(playPosition, "playPosition should be nil")
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
    }

    func test_verticalWin2345() {
        
        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[5][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[4][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[3][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[2][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[1][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[0][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let playPosition = gameBoard.playPiece(at: 3, for: .one)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }

    func test_horizontalWin1234() {
        
        let _ = gameBoard.playPiece(at: 1, for: .one)
        targetGameBoard[5][1] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 2, for: .one)
        targetGameBoard[5][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[5][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .one)
        targetGameBoard[5][4] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(at: 4, for: .one)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }

    func test_horizontalWin1243() {
        
        let _ = gameBoard.playPiece(at: 1, for: .one)
        targetGameBoard[5][1] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 2, for: .one)
        targetGameBoard[5][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .one)
        targetGameBoard[5][4] = .one

        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[5][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(at: 4, for: .one)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }

    func test_horizontalWin0132() {
        
        let _ = gameBoard.playPiece(at: 0, for: .one)
        targetGameBoard[5][0] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 1, for: .one)
        targetGameBoard[5][1] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[5][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 2, for: .one)
        targetGameBoard[5][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(at: 4, for: .one)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }
    
    func test_horizontalWin23564() {
        
        let _ = gameBoard.playPiece(at: 2, for: .one)
        targetGameBoard[5][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[5][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 5, for: .one)
        targetGameBoard[5][5] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 6, for: .one)
        targetGameBoard[5][6] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .one)
        targetGameBoard[5][4] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let playPosition = gameBoard.playPiece(at: 2, for: .one)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }
    
    func test_diagonalWinNWSE1230() {
        
        let _ = gameBoard.playPiece(at: 1, for: .two)
        targetGameBoard[5][1] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 2, for: .two)
        targetGameBoard[5][2] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[5][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 2, for: .two)
        targetGameBoard[4][2] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[4][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[3][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 1, for: .one)
        targetGameBoard[4][1] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 2, for: .one)
        targetGameBoard[3][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[2][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 0, for: .one)
        targetGameBoard[5][0] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(at: 2, for: .one)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }
    func test_diagonalWinNWSE1234() {
        
        let _ = gameBoard.playPiece(at: 2, for: .two)
        targetGameBoard[5][2] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[5][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .two)
        targetGameBoard[5][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[4][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .two)
        targetGameBoard[4][4] = .two

        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .two)
        targetGameBoard[3][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 1, for: .one)
        targetGameBoard[5][1] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 2, for: .one)
        targetGameBoard[4][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[3][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .one)
        targetGameBoard[2][4] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let playPosition = gameBoard.playPiece(at: 2, for: .one)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }
    
    func test_diagonalWinNWSE1243() {
        
        let _ = gameBoard.playPiece(at: 2, for: .two)
        targetGameBoard[5][2] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[5][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .two)
        targetGameBoard[5][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[4][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .two)
        targetGameBoard[4][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .two)
        targetGameBoard[3][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 1, for: .one)
        targetGameBoard[5][1] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 2, for: .one)
        targetGameBoard[4][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .one)
        targetGameBoard[2][4] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[3][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(at: 2, for: .one)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }
    
    // TODO: Update for 4+ win
    // func test_diagonalWinNWSE23465() {
    func test_diagonalWinNWSE3465() {
        
        let _ = gameBoard.playPiece(at: 2, for: .two)
        targetGameBoard[5][2] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[5][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .two)
        targetGameBoard[5][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .two)
        targetGameBoard[4][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .two)
        targetGameBoard[4][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .two)
        targetGameBoard[3][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 1, for: .one)
        targetGameBoard[5][1] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 2, for: .one)
        targetGameBoard[4][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 4, for: .one)
        targetGameBoard[2][4] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(at: 3, for: .one)
        targetGameBoard[3][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let playPosition = gameBoard.playPiece(at: 2, for: .one)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }
    
    // TODO: add
    func test_diagonalWinNESW1230() {
    }
    func test_diagonalWinNESW1234() {
    }
    func test_diagonalWinNESW23465() {
    }

    func areMatchingGameBoards(_ lhs: FourInARowGameBoard, _ rhs: FourInARowGameBoard) -> Bool {
        if lhs == rhs {
            return true
        }
        
        XCTFail("Game Board does not match target\n\(gameBoard.board.description)\n\(targetGameBoard.description)")
        return false
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
