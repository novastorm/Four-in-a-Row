//
//  GameBoardInitTests.swift
//  FourInARowTests
//
//  Created by Adland Lee on 9/1/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import XCTest

@testable import FourInARow

class GameBoardInitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_gameBoard_init() {
        let numRows = 6
        let numCols = 7
        
        let targetGameBoard = Array(
            repeating: Array(
                repeating: GameBoardSlot.none,
                count: numCols),
            count: numRows
        )
        
        let gameBoard = FourInARowGame()
        
        XCTAssert(gameBoard.board == targetGameBoard, "Initialized Game Board is not empty.")
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
        
        targetGameBoard[0][3] = .one
        
        guard let gameBoard = FourInARowGame(board: targetGameBoard) else {
            assertionFailure("Game Board should not be nil")
            return
        }
        
        XCTAssert(gameBoard.board == targetGameBoard, "Initialized Game Board does not match target.")
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
