//
//  Vector.swift
//  FourInARow
//
//  Created by Adland Lee on 9/1/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

class Vector: Equatable {
    
    var x: Int
    var y: Int
    
    init(_ x: Int , _ y: Int) {
        self.x = x
        self.y = y
    }
    
    static func == (lhs: Vector, rhs: Vector) -> Bool {
        return lhs.x == rhs.x
            && lhs.y == rhs.y
    }
    
    static func != (lhs: Vector, rhs: Vector) -> Bool {
        return !(lhs == rhs)
    }
    
    static func == (lhs: Vector, rhs: (x:Int, y:Int)) -> Bool {
        return lhs.x == rhs.x
            && lhs.y == rhs.y
    }
    static func != (lhs: Vector, rhs: (x:Int, y:Int)) -> Bool {
        return !(lhs == rhs)
    }
    
    static func == (lhs: (x:Int, y:Int), rhs: Vector) -> Bool {
        return lhs.x == rhs.x
            && lhs.y == rhs.y
    }
    static func != (lhs: (x:Int, y:Int), rhs: Vector) -> Bool {
        return !(lhs == rhs)
    }
    
    static func * (lhs: Vector, factor: Int) -> Vector {
        return Vector(lhs.x * factor, lhs.y * factor)
    }
    
    static func + (lhs: Vector, rhs: Vector) -> Vector {
        return Vector(lhs.x + rhs.x, lhs.y + rhs.y)
    }
    
    static func + (lhs: Vector, addend: Int) -> Vector {
        return Vector(lhs.x + addend, lhs.y + addend)
    }
}
