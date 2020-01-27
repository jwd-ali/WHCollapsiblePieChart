//
//  PieChartDelegate.swift
//  CollapsiblePieChart
//
//  Created by WAJAHAT HASSAN on 09/11/2019.
//  Copyright © 2019 WAJAHAT HASSAN. All rights reserved.


import UIKit

public protocol PieChartDelegate: class {
    
    func onGenerateSlice(slice: PieSlice)
    
    func onStartAnimation(slice: PieSlice)
    
    func onEndAnimation(slice: PieSlice)
    
    func onSelected(slice: PieSlice, selected: Bool)
}

extension PieChartDelegate {
    
    public func onGenerateSlice(slice: PieSlice) {}
    
    public func onStartAnimation(slice: PieSlice) {}
    
    public func onEndAnimation(slice: PieSlice) {}
}
