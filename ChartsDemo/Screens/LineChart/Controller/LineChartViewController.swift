//
//  LineChartViewController.swift
//  ChartsDemo
//
//  Created by Milton Palaguachi on 2/10/21.
//

import UIKit
import Charts

class LineChartViewController: UIViewController {
    
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var speedButton: UIButton!
    @IBOutlet weak var elevationButton: UIButton!
    @IBOutlet weak var cadenceButton: UIButton!
    var dataEntries = [ChartDataEntry]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.lineChartView.delegate = self
        for x in 0...20 {
            let y = Double.random(in: 0...20)
            self.dataEntries.append(ChartDataEntry(x: Double(x), y: y))
        }
        self.updateChartData()
    }
    
    @IBAction func speedChart(_ sender: UIButton) {
        
    }
    
    @IBAction func elevationChart(_ sender: UIButton) {
        
    }
    @IBAction func cadenceChart(_ sender: UIButton) {
        
    }
    
    private func updateChartData() {
        let chartDataSet = LineChartDataSet(entries: self.dataEntries, label: nil)
        let chartData = LineChartData(dataSet: chartDataSet)
        chartDataSet.colors = ChartColorTemplates.pastel()
        self.lineChartView.data = chartData
    }

}

extension LineChartViewController: ChartViewDelegate {
    
}
