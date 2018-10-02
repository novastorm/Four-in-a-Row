//
//  Vector.swift
//  FourInARow
//
//  Created by Adland Lee on 9/1/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

class FourInARowVector2D: Equatable {
    
    var col: Int
    var row: Int
    
    init(_ row: Int = 0, _ col: Int = 0) {
        self.row = row
        self.col = col
    }

    init(_ pos:(Int, Int)) {
        self.row = pos.0
        self.col = pos.1
    }
    
    static func == (lhs: FourInARowVector2D, rhs: FourInARowVector2D) -> Bool {
        return lhs.row == rhs.row
            && lhs.col == rhs.col
    }
    
    static func != (lhs: FourInARowVector2D, rhs: FourInARowVector2D) -> Bool {
        return !(lhs == rhs)
    }
    
    static func == (lhs: FourInARowVector2D, rhs: (row: Int, col: Int)) -> Bool {
        return lhs.row == rhs.row
            && lhs.col == rhs.col
    }

    static func != (lhs: FourInARowVector2D, rhs: (row: Int, col: Int)) -> Bool {
        return !(lhs == rhs)
    }
    
    static func == (lhs: (row: Int, col: Int), rhs: FourInARowVector2D) -> Bool {
        return lhs.row == rhs.row
            && lhs.col == rhs.col
    }
    static func != (lhs: (row: Int, col: Int), rhs: FourInARowVector2D) -> Bool {
        return !(lhs == rhs)
    }
    
    static func * (lhs: FourInARowVector2D, factor: Int) -> FourInARowVector2D {
        return FourInARowVector2D(lhs.row * factor, lhs.col * factor)
    }
    
    static func + (lhs: FourInARowVector2D, rhs: FourInARowVector2D) -> FourInARowVector2D {
        return FourInARowVector2D(lhs.row + rhs.row, lhs.col + rhs.col)
    }
    
    static func + (lhs: FourInARowVector2D, addend: Int) -> FourInARowVector2D {
        return FourInARowVector2D(lhs.row + addend, lhs.col + addend)
    }
}
