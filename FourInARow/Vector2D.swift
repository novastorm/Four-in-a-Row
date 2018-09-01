//
//  Vector.swift
//  FourInARow
//
//  Created by Adland Lee on 9/1/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

class Vector2D: Equatable {
    
    var x: Int
    var y: Int
    
    init(_ x: Int = 0 , _ y: Int = 0) {
        self.x = x
        self.y = y
    }
    
    static func == (lhs: Vector2D, rhs: Vector2D) -> Bool {
        return lhs.x == rhs.x
            && lhs.y == rhs.y
    }
    
    static func != (lhs: Vector2D, rhs: Vector2D) -> Bool {
        return !(lhs == rhs)
    }
    
    static func == (lhs: Vector2D, rhs: (x: Int, y: Int)) -> Bool {
        return lhs.x == rhs.x
            && lhs.y == rhs.y
    }

    static func != (lhs: Vector2D, rhs: (x: Int, y: Int)) -> Bool {
        return !(lhs == rhs)
    }
    
    static func == (lhs: (x: Int, y: Int), rhs: Vector2D) -> Bool {
        return lhs.x == rhs.x
            && lhs.y == rhs.y
    }
    static func != (lhs: (x: Int, y: Int), rhs: Vector2D) -> Bool {
        return !(lhs == rhs)
    }
    
    static func * (lhs: Vector2D, factor: Int) -> Vector2D {
        return Vector2D(lhs.x * factor, lhs.y * factor)
    }
    
    static func + (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        return Vector2D(lhs.x + rhs.x, lhs.y + rhs.y)
    }
    
    static func + (lhs: Vector2D, addend: Int) -> Vector2D {
        return Vector2D(lhs.x + addend, lhs.y + addend)
    }
}
