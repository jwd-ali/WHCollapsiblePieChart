//
//  PieSlice.swift
//  CollapsiblePieChart
//
//  Created by WAJAHAT HASSAN on 09/11/2019.
//  Copyright © 2019 WAJAHAT HASSAN. All rights reserved.

import UIKit

public struct PieSlice: CustomDebugStringConvertible {
    public let view: PieSliceLayer
    public internal(set) var data: PieSliceData
    
    public init(data: PieSliceData, view: PieSliceLayer) {
        self.data = data
        self.view = view
    }
    
    public var debugDescription: String {
        return data.debugDescription
        //print abch
    }
}
