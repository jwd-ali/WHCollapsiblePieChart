//
//  FloatingPoint+Extension.swift
//  CollapsiblePieChart
//
//  Created by WAJAHAT HASSAN on 09/11/2019.
//  Copyright © 2019 WAJAHAT HASSAN. All rights reserved.
//

import Foundation

extension FloatingPoint {
    
    var degreesToRadians: Self {
        return self * .pi / 180
    }
    
    var radiansToDegrees: Self {
        return self * 180 / .pi
    }
    
    func truncate(_ fractions: Self) -> Self {
        return Darwin.round(self * fractions) / fractions
    }
    
    func truncateDefault() -> Self {
        return truncate(10000000)
    }
}
