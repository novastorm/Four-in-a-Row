//
//  Utilities.swift
//  FourInARow
//
//  Created by Adland Lee on 10/3/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

/**
 Random number generator between upper and lower numbers inclusive.
 
 - Parameters:
 - upper: Upper value
 - lower: Lower value. Default is 0
 */

func random(_ upper: Int, start lower: Int = 0) -> Int {
    return Int(arc4random_uniform(UInt32(upper - lower + 1))) + lower
}

