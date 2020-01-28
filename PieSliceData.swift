//
//  PieSliceData.swift
//  CollapsiblePieChart
//
//  Created by WAJAHAT HASSAN on 09/11/2019.
//  Copyright © 2019 WAJAHAT HASSAN. All rights reserved.
//

import UIKit

public class PieSliceData: CustomDebugStringConvertible {
    
    public let model: PieSliceModel
    public internal(set) var id: Int
    public internal(set) var percentage: Double
    
    public init(model: PieSliceModel, id: Int, percentage: Double) {
        self.model = model
        self.id = id
        self.percentage = percentage
    }
    
    public var debugDescription: String {
        return "{model: \(model.debugDescription), id: \(id), percentage: \(percentage)}"
    }
}

