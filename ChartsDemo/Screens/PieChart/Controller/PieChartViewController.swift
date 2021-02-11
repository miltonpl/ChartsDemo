//
//  ViewController.swift
//  ChartsDemo
//
//  Created by Milton Palaguachi on 2/10/21.
//

import UIKit
import Charts
class PieChartViewController: UIViewController {
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var iosStepper: UIStepper!
    @IBOutlet weak var macStepper: UIStepper!
    var iosDataEntry: PieChartDataEntry = PieChartDataEntry(value: 0)
    var macDataEntry: PieChartDataEntry = PieChartDataEntry(value: 0)
    var numberOfDownloadDataEntries = [PieChartDataEntry]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pieChart.chartDescription?.text = "Chart Description"
        self.iosDataEntry.value = iosStepper.value
        self.iosDataEntry.label = "iOS"
        
        self.macDataEntry.value = macStepper.value
        self.macDataEntry.label = "maciOS"
        self.numberOfDownloadDataEntries = [iosDataEntry, macDataEntry]
        self.updateChartData()
    }
    
    
    @IBAction func changediOS(_ sender: UIStepper) {
        print("iOS value: \(sender.value)")
        self.iosDataEntry.value = sender.value
        self.updateChartData()
    }
    
    @IBAction func changedMac(_ sender: UIStepper) {
        print("mac value: \(sender.value)")
        self.macDataEntry.value = sender.value
        self.updateChartData()
    }
    
    private func updateChartData() {
        let chartDataSet = PieChartDataSet(entries: self.numberOfDownloadDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors: [UIColor] = [.blue, .darkGray]
        chartDataSet.colors = colors 
        self.pieChart.data = chartData
    }
}
