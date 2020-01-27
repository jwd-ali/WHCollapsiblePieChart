//
//  PieSliceModel.swift
//  CollapsiblePieChart
//
//  Created by WAJAHAT HASSAN on 09/11/2019.
//  Copyright © 2019 WAJAHAT HASSAN. All rights reserved.

import UIKit

public class PieSliceModel: CustomDebugStringConvertible {
    
    public let value: Double
    public let color: UIColor

    public init(value: Double, color: UIColor) {
        self.value = value
        self.color = color
    }
    
    public var debugDescription: String {
        return "{value: \(value)}"
    }
}
