//
//  Direction.swift
//  FourInARow
//
//  Created by Adland Lee on 9/1/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

class Direction: Vector {
    static let none = Direction( 0,  0)
    
    static let n    = Direction( 0, -1)
    static let ne   = Direction( 1, -1)
    static let e    = Direction( 1,  0)
    static let se   = Direction( 1,  1)
    static let s    = Direction( 0,  1)
    static let sw   = Direction(-1,  1)
    static let w    = Direction(-1,  0)
    static let nw   = Direction(-1, -1)
}
