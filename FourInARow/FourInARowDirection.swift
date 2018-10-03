//
//  Direction.swift
//  FourInARow
//
//  Created by Adland Lee on 9/1/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

class FourInARowDirection: FourInARowVector2D {
    static let none = FourInARowDirection( 0,  0)
    
    static let n  = FourInARowDirection(-1,  0)
    static let ne = FourInARowDirection(-1,  1)
    static let e  = FourInARowDirection( 0,  1)
    static let se = FourInARowDirection( 1,  1)
    static let s  = FourInARowDirection( 1,  0)
    static let sw = FourInARowDirection( 1, -1)
    static let w  = FourInARowDirection( 0, -1)
    static let nw = FourInARowDirection(-1, -1)
}
