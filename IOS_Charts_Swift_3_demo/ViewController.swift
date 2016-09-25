//
//  ViewController.swift
//  IOS_Charts_Swift_3_demo
//
//  Created by Alexander Murphy on 9/24/16.
//  Copyright © 2016 Alexander Murphy. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    @IBOutlet var barChart: BarChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.noDataText = "You need to provide data for the chart."
        // Do any additional setup after loading the view.

        // Get and prepare the data
        let sales = DataGenerator.data()

        // Initialize an array to store chart data entries (values; y axis)
        var salesEntries = [ChartDataEntry]()

        // Initialize an array to store months (labels; x axis)
        var salesMonths = [String]()

        var i = 0
        for sale in sales {
            // Create single chart data entry and append it to the array
            let saleEntry = BarChartDataEntry(value: sale.value, xIndex: i)
            salesEntries.append(saleEntry)

            // Append the month to the array
            salesMonths.append(sale.month)

            i += 1

    }

        // Create bar chart data set containing salesEntries
        let chartDataSet = BarChartDataSet(values: salesEntries, label: "Profit")

        // Create bar chart data with data set and array with values for x axis
        let chartData = BarChartData(xVals: salesMonths, dataSets: [chartDataSet])

        // Set bar chart data to previously created data
        barChart.data = chartData

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
