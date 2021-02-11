//
//  GraphChartViewController.swift
//  ChartsDemo
//
//  Created by Milton Palaguachi on 2/10/21.
//

import UIKit
import Charts
import TinyConstraints
class GraphChartViewController: UIViewController {
    @IBOutlet weak var lineChartView: LineChartView! {
        didSet {
            self.lineChartView.borderColor = .blue
            self.lineChartView.rightAxis.enabled = false
            let yAxis = self.lineChartView.leftAxis
            yAxis.labelFont = .boldSystemFont(ofSize: 10)
            yAxis.setLabelCount(6, force: false)
            yAxis.labelTextColor = .blue
            yAxis.axisLineColor = .blue
            yAxis.labelPosition = .insideChart
            self.lineChartView.xAxis.gridColor = .blue
            self.lineChartView.xAxis.axisLineColor = .blue
            self.lineChartView.xAxis.labelPosition = .bottom
            self.lineChartView.xAxis.labelTextColor = .blue
            self.lineChartView.xAxis.labelFont = .boldSystemFont(ofSize: 10)
            self.lineChartView.xAxis.setLabelCount(4, force: false)
            self.lineChartView.animate(xAxisDuration: 2.5)
        }
    }
    var elevationDataEntries = [ChartDataEntry]()
    var speedDataEntries = [ChartDataEntry]()
    var elevationDataSet: LineChartDataSet?
    var speedDataSet: LineChartDataSet?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSpeedLine()
        self.setupElevationLine()
        self.setupDataSets()
    }
    
    func setupSpeedLine() {
        for x in 0...30 {
            let y = Double.random(in: 0...100)
            self.speedDataEntries.append(ChartDataEntry(x: Double(x), y: y))
        }
        
        let chartDataSet = LineChartDataSet(entries: self.speedDataEntries, label: "Epeed")
        chartDataSet.drawCirclesEnabled = false
        chartDataSet.mode = .cubicBezier
        chartDataSet.lineWidth = 1.5
        chartDataSet.setColor(.red)
        self.speedDataSet = chartDataSet
    }
    
    func setupElevationLine() {
        for x in 0...30 {
            let y = Double.random(in: 0...100)
            self.elevationDataEntries.append(ChartDataEntry(x: Double(x), y: y))
        }
        let chartDataSet = LineChartDataSet(entries: self.elevationDataEntries, label: "Elevation")
        chartDataSet.drawCirclesEnabled = false
        chartDataSet.mode = .cubicBezier
        chartDataSet.lineWidth = 1.5
        chartDataSet.fill = Fill(color: .blue)
        chartDataSet.fillAlpha = 0.2
        chartDataSet.drawFilledEnabled = true
        chartDataSet.setColor(.blue)
        self.elevationDataSet = chartDataSet
    }
    
    func setupDataSets() {
        guard let speedDataSet = self.speedDataSet, let elevationDataSet = self.elevationDataSet else { return }
        let chartData = LineChartData(dataSets: [speedDataSet, elevationDataSet])
        chartData.setDrawValues(false)
        self.lineChartView.data = chartData
    }
}
