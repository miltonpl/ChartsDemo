//
//  BarChartViewController.swift
//  ChartsDemo
//
//  Created by Milton Palaguachi on 2/10/21.
//

import UIKit
import Charts
class BarChartViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    var dataEntries = [BarChartDataEntry]()
    override func viewDidLoad() {
        super.viewDidLoad()
        for x in 0...10 {
            self.dataEntries.append(BarChartDataEntry(x: Double(x), y: Double(x)))
        }
        self.updateChartData()
    }
    
    
    private func updateChartData() {
        let chartDataSet = BarChartDataSet(entries: self.dataEntries, label: nil)
        let chartData = BarChartData(dataSet: chartDataSet)
        chartDataSet.colors = ChartColorTemplates.joyful()
        self.barChartView.data = chartData
    }
    
}
