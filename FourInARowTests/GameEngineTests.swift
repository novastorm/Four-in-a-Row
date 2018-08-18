//
//  GameEngineTests.swift
//  FourInARowTests
//
//  Created by Adland Lee on 8/17/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import XCTest

@testable import FourInARow

class GameEngineTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let gameEngine = GameEngine()
        let player1 = Player(id: 0, chipColor: .red)
        let player2 = Player(id: 1, chipColor: .yellow)
        
        var play: FourInARowPlay
        play = FourInARowPlay(player: player1, column: 3)
        let _ = gameEngine.placePlay(play)
        play = FourInARowPlay(player: player2, column: 3)
        let _ = gameEngine.placePlay(play)
        play = FourInARowPlay(player: player1, column: 3)
        let _ = gameEngine.placePlay(play)
        play = FourInARowPlay(player: player2, column: 3)
        let _ = gameEngine.placePlay(play)
        play = FourInARowPlay(player: player1, column: 3)
        let _ = gameEngine.placePlay(play)
        play = FourInARowPlay(player: player2, column: 3)
        let _ = gameEngine.placePlay(play)
        play = FourInARowPlay(player: player1, column: 3)
        let position = gameEngine.placePlay(play)

    }
    
    func printGameboard(_ gameBoard: GameBoard) {
        for r in stride(from: 5, through: 0, by: -1) {
            for c in 0 ... 6 {
                var chip: String
                switch gameBoard[r][c].player?.id {
                case 0:
                    chip = "X"
                case 1:
                    chip = "O"
                default:
                    chip = " "
                }
                print("[\(chip)]", terminator:"")
            }
            print()
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
