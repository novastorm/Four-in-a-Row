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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_gameBoard_initWithBoard() {
        let numRows = 6
        let numCols = 7
        
        var targetGameBoard = Array(
            repeating: Array(
                repeating: GameBoardSlot.none,
                count: numCols),
            count: numRows
        )
        
        targetGameBoard[0][4] = .one
        
        guard let gameBoard = FourInARowGameBoard(board: targetGameBoard) else {
            assertionFailure("Game Board should not be nil")
            return
        }

        targetGameBoard[0][4] = .none
        gameBoard.reset()

        XCTAssert(gameBoard.board == targetGameBoard, "Initialized Game Board does not match target.")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
