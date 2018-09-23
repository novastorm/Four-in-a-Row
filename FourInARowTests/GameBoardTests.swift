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
                repeating: GameBoardSlot.none,
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
        
        let _ = gameBoard.playPiece(for: .one, at: 0)
        targetGameBoard[0][0] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        gameBoard.reset()
        targetGameBoard[0][0] = .none

        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
    }
    
    func test_fillBoard() {
        
        var slot = GameBoardSlot.none
        
        for r in 0 ..< numRows {
            for c in 0 ..< numCols {
                if (r % 2 == 0 && c % 3 == 0) || (r % 2 != 0 && c % 3 != 0) {
                    slot = .one
                }
                else {
                    slot = .two
                }
                let _ = gameBoard.playPiece(for: slot, at: c)
                targetGameBoard[r][c] = slot
                XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
            }
        }
        print("Game Board and target\n\(gameBoard.board.description)\n\(targetGameBoard.description)")
        for c in 0 ..< numCols {
            let playPosition = gameBoard.playPiece(for: .one, at: c)
            XCTAssertNil(playPosition, "playPosition at:\(c) should be nil")
        }
    }

    func test_playPieceVertical() {

        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[0][3] = .one

        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[1][3] = .two

        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[2][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[3][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[4][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[5][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(for: .one, at: 3)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }
    
    func test_playPieceHorizontal() {
        
        let _ = gameBoard.playPiece(for: .one, at: 0)
        targetGameBoard[0][0] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 1)
        targetGameBoard[0][1] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 2)
        targetGameBoard[0][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[0][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 4)
        targetGameBoard[0][4] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 5)
        targetGameBoard[0][5] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 6)
        targetGameBoard[0][6] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(for: .one, at: 7)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }

    func test_verticalWin0123() {
        
        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[0][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[1][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[2][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[3][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(for: .one, at: 3)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }

    func test_verticalWin2345() {
        
        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[0][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[1][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[2][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[3][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[4][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[5][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let playPosition = gameBoard.playPiece(for: .one, at: 3)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }

    func test_horizontalWin1234() {
        
        let _ = gameBoard.playPiece(for: .one, at: 1)
        targetGameBoard[0][1] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 2)
        targetGameBoard[0][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[0][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 4)
        targetGameBoard[0][4] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(for: .one, at: 4)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }

    func test_horizontalWin1243() {
        
        let _ = gameBoard.playPiece(for: .one, at: 1)
        targetGameBoard[0][1] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 2)
        targetGameBoard[0][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 4)
        targetGameBoard[0][4] = .one

        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[0][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(for: .one, at: 4)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }

    func test_horizontalWin0132() {
        
        let _ = gameBoard.playPiece(for: .one, at: 0)
        targetGameBoard[0][0] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .one, at: 1)
        targetGameBoard[0][1] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[0][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .one, at: 2)
        targetGameBoard[0][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(for: .one, at: 4)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }
    
    func test_horizontalWin3564() {
        
        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[0][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 5)
        targetGameBoard[0][5] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 6)
        targetGameBoard[0][6] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 4)
        targetGameBoard[0][4] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let playPosition = gameBoard.playPiece(for: .one, at: 2)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }
    
    func test_diagonalWinNWSE1230() {
        
        let _ = gameBoard.playPiece(for: .two, at: 1)
        targetGameBoard[0][1] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .two, at: 2)
        targetGameBoard[0][2] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[0][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 2)
        targetGameBoard[1][2] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[1][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[2][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 1)
        targetGameBoard[1][1] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 2)
        targetGameBoard[2][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[3][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 0)
        targetGameBoard[0][0] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(for: .one, at: 2)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }
    func test_diagonalWinNWSE1234() {
        
        let _ = gameBoard.playPiece(for: .two, at: 2)
        targetGameBoard[0][2] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[0][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 4)
        targetGameBoard[0][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[1][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 4)
        targetGameBoard[1][4] = .two

        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 4)
        targetGameBoard[2][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .one, at: 1)
        targetGameBoard[0][1] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .one, at: 2)
        targetGameBoard[1][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[2][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 4)
        targetGameBoard[3][4] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let playPosition = gameBoard.playPiece(for: .one, at: 2)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }
    
    func test_diagonalWinNWSE1243() {
        
        let _ = gameBoard.playPiece(for: .two, at: 2)
        targetGameBoard[0][2] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[0][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 4)
        targetGameBoard[0][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[1][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 4)
        targetGameBoard[1][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 4)
        targetGameBoard[2][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 1)
        targetGameBoard[0][1] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 2)
        targetGameBoard[1][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 4)
        targetGameBoard[3][4] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[2][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))

        let playPosition = gameBoard.playPiece(for: .one, at: 2)
        XCTAssertNil(playPosition, "playPosition should be nil")
    }
    
    func test_diagonalWinNWSE3465() {
        
        let _ = gameBoard.playPiece(for: .two, at: 2)
        targetGameBoard[0][2] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[0][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 4)
        targetGameBoard[0][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 3)
        targetGameBoard[1][3] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 4)
        targetGameBoard[1][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .two, at: 4)
        targetGameBoard[2][4] = .two
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 1)
        targetGameBoard[0][1] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 2)
        targetGameBoard[1][2] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 4)
        targetGameBoard[3][4] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let _ = gameBoard.playPiece(for: .one, at: 3)
        targetGameBoard[2][3] = .one
        
        XCTAssertTrue(areMatchingGameBoards(gameBoard.board, targetGameBoard))
        
        let playPosition = gameBoard.playPiece(for: .one, at: 2)
        XCTAssertNil(playPosition, "playPosition should be nil")
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
