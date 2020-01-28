//
//  PieChart.swift
//  CollapsiblePieChart
//
//  Created by WAJAHAT HASSAN on 09/11/2019.
//  Copyright © 2019 WAJAHAT HASSAN. All rights reserved.

import UIKit

open class PieChart: UIView {
    
    // MARK: - Properties
    
    private var innerRadius: CGFloat?
    private var outerRadius: CGFloat?
    private var strokeColor: UIColor?
    private var strokeWidth: CGFloat?
    private var selectedOffset: CGFloat?
    private var animDuration: Double?
    
    /// Inner radius of slices - set this to 0 for "no gap".
    public var inrRadius: CGFloat = 50 { didSet { innerRadius = inrRadius } }
    
    /// Outer radius of slices.
    public var outRadius: CGFloat = 100 { didSet { outerRadius = outRadius } }
    
    /// Stroke (border) color of slices.
    public var outlineStrockColor: UIColor = UIColor.black { didSet { strokeColor = outlineStrockColor } }
    
    /// Stroke (border) width of slices.
    public var outlineStrockWidth: CGFloat = 0 { didSet { strokeWidth = outlineStrockWidth } }
    
    /// Pt that will be added to (inner/outer)radius of slice when selecting it.
    public var sliceSelectedOffset: CGFloat = 10 { didSet { selectedOffset = sliceSelectedOffset } }
    
    /// Duration it takes to slices to expand.
    public var sliceAnimationDuration: Double = 0.5 { didSet { animDuration = sliceAnimationDuration } }
    
    var animated: Bool {
        return animDuration ?? 0 > 0
    }
    
    // MARK: - Implementation
    
    public fileprivate(set) var container: CALayer = CALayer()
    
    public fileprivate(set) var slices: [PieSlice] = []
    
    public var models: [PieSliceModel] = [] {
        didSet {
            if oldValue.isEmpty {
                slices = generateSlices(models)
                showSlices()
            }
        }
    }
    
    public weak var delegate: PieChartDelegate?
    
    public var layers: [PieChartLayer] = [] {
        didSet {
            for layer in layers {
                layer.chart = self
            }
        }
    }
    
    public var totalValue: Double {
        return models.reduce(0){$0 + $1.value}
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() {
        layer.addSublayer(container)
        container.frame = bounds
    }
    
    fileprivate func generateSlices(_ models: [PieSliceModel]) -> [PieSlice] {
        var slices: [PieSlice] = []
        var lastEndAngle: CGFloat = 0
        
        for (index, model) in models.enumerated() {
            let (newEndAngle, slice) = generateSlice(model: model, index: index, lastEndAngle: lastEndAngle, totalValue: totalValue)
            slices.append(slice)
            
            lastEndAngle = newEndAngle
        }
        
        return slices
    }
    
    fileprivate func generateSlice(model: PieSliceModel, index: Int, lastEndAngle: CGFloat, totalValue: Double) -> (CGFloat, PieSlice) {
        let percentage = 1 / (totalValue / model.value)
        let angle = (Double.pi * 2) * percentage
        let newEndAngle = lastEndAngle + CGFloat(angle)
        
        let data = PieSliceData(model: model, id: index, percentage: percentage)
        let slice = PieSlice(data: data, view: PieSliceLayer(color: model.color, startAngle: lastEndAngle, endAngle: newEndAngle, animDelay: 0, center: bounds.center))
        
        slice.view.frame = bounds
        
        slice.view.sliceData = data
        
        slice.view.innerRadius = innerRadius ?? 0
        slice.view.outerRadius = outerRadius ?? 0
        slice.view.selectedOffset = selectedOffset ?? 0
        slice.view.animDuration = animDuration ?? 0
        slice.view.strokeColor = strokeColor ?? UIColor.black
        slice.view.strokeWidth = strokeWidth ?? 0
        
        slice.view.sliceDelegate = self
        
        self.delegate?.onGenerateSlice(slice: slice)
        
        return (newEndAngle, slice)
    }
    
    
    fileprivate func showSlices() {
        for slice in slices {
            container.addSublayer(slice.view)
            slice.view.rotate(angle: slice.view.referenceAngle)
            slice.view.present(animated: animated)
        }
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: self)
            
            if let slice = (slices.filter{$0.view.contains(point)}).first {
                slice.view.selected = !slice.view.selected
            }
        }
    }
}

extension PieChart: PieSliceDelegate {
    
    public func onStartAnimation(slice: PieSlice) {
        for layer in layers {
            layer.onStartAnimation(slice: slice)
        }
        delegate?.onStartAnimation(slice: slice)
    }
    
    public func onEndAnimation(slice: PieSlice) {
        for layer in layers {
            layer.onEndAnimation(slice: slice)
        }
        delegate?.onEndAnimation(slice: slice)
    }
    
    public func onSelected(slice: PieSlice, selected: Bool) {
        for layer in layers {
            layer.onSelected(slice: slice, selected: selected)
        }
        delegate?.onSelected(slice: slice, selected: selected)
    }
}
