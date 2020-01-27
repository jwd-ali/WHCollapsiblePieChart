//
//  ViewController.swift
//  WHCollapsiblePieChart
//
//  Created by wajahathassan64 on 01/28/2020.
//  Copyright (c) 2020 wajahathassan64. All rights reserved.
//

import UIKit
import WHCollapsiblePieChart

class ViewController: UIViewController, PieChartDelegate {
    
    @IBOutlet weak var chartContainerView: UIView!
    
    fileprivate var currentColorIndex = 0
    fileprivate static let alpha: CGFloat = 1
    
    lazy var chartView: PieChart = {
        let view = PieChart()
        view.inrRadius = 50
        view.outRadius = 80
        view.sliceSelectedOffset = 10.0
        view.sliceAnimationDuration = 0.5
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        view.widthAnchor.constraint(equalToConstant: 300).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let colors = [
        UIColor.yellow.withAlphaComponent(alpha),
        UIColor.green.withAlphaComponent(alpha),
        UIColor.purple.withAlphaComponent(alpha),
        UIColor.cyan.withAlphaComponent(alpha),
        UIColor.darkGray.withAlphaComponent(alpha),
        UIColor.red.withAlphaComponent(alpha),
        UIColor.magenta.withAlphaComponent(alpha),
        UIColor.orange.withAlphaComponent(alpha),
        UIColor.brown.withAlphaComponent(alpha),
        UIColor.lightGray.withAlphaComponent(alpha),
        UIColor.gray.withAlphaComponent(alpha),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chartContainerView.addSubview(chartView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        chartView.delegate = self
        chartView.models = createModels() // order is important - models have to be set at the end
        
    }
    
    // MARK: - PieChartDelegate
    func onSelected(slice: PieSlice, selected: Bool) {
        print("Selected: \(selected), slice: \(slice)")
    }
    
    // MARK: - Models
    fileprivate func createModels() -> [PieSliceModel] {
        
        let models = [
            PieSliceModel(value: 16.6666666667, color: colors[0]),
            PieSliceModel(value: 16.6666666667, color: colors[1]),
            PieSliceModel(value: 16.6666666667, color: colors[2]),
            PieSliceModel(value: 16.6666666667, color: colors[3]),
            PieSliceModel(value: 16.6666666667, color: colors[4]),
            PieSliceModel(value: 16.6666666667, color: colors[5])
        ]
        
        currentColorIndex = models.count
        return models
    }
    
}

