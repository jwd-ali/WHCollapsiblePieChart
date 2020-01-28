//
//  PieChartLayer.swift
//  CollapsiblePieChart
//
//  Created by WAJAHAT HASSAN on 09/11/2019.
//  Copyright © 2019 WAJAHAT HASSAN. All rights reserved.

import UIKit

public protocol PieChartLayer: PieChartDelegate {
    var chart: PieChart? {get set}
    func onEndAnimation(slice: PieSlice)
    func clear()
}
