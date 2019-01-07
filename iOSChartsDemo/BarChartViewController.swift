//
//  BarChartViewController.swift
//  iOSChartsDemo
//
//  Created by Joyce Echessa on 6/12/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import Charts
import Foundation
//如果編譯出現錯誤，請先解壓縮Charts.zip
class BarChartViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    var mainData: [String:[AirData]]?
    var countys: [String]!
    var aqiData: [Double]!
    
    
    func setChart(_ dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "loading..."
        var colors: [UIColor] = []
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
            
            colors.append(getAqiColor(value: values[i]))
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "AQI指數")
        chartDataSet.colors = colors
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
    }
    
    //aqi指數相對應的顏色
    func getAqiColor(value:Double)->UIColor{
        switch value {
        case 0..<51: return UIColor(red: 0, green: 230/255, blue: 0, alpha: 1)
        case 51..<101: return UIColor(red: 230/255, green: 230/255, blue: 1/255, alpha: 1)
        case 101..<151: return UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)
        case 101..<151: return UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        default:
            return UIColor(red: 127/255, green: 1/255, blue: 127/255, alpha: 1)
        }
    }
    
    //統計每個縣市的aqi指數平均
    func gatAverage(values:[AirData]?)->Double{
        var sum: Double = 0.0
        var count: Int = 0
        if let values = values{
            for element in values{
                if let aqi = Double(element.aQI){
                    count = count+1
                    sum = sum + aqi
                }
            }
            return sum/Double(count)
        }
        return sum
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countys = ["連江縣", "金門縣", "澎湖縣", "基隆市", "宜蘭縣", "新北市", "臺北市", "桃園市", "新竹市", "新竹縣", "苗栗縣", "南投縣", "臺中市", "彰化縣", "雲林縣", "嘉義市", "嘉義縣", "臺南市", "高雄市", "屏東縣", "花蓮縣", "臺東縣"]
        aqiData = []
        /*
        let url = URL(string: "https://opendata.epa.gov.tw/webapi/api/rest/datastore/355000000I-000259?sort=County&offset=0&limit=1000")!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response , error) in
            //print(data)
            
            /*if let data = data, let content = String (data: data, encoding: .utf8) {
                print(content)
            }*/
            DispatchQueue.main.async {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let data = data, let airResults = try? decoder.decode(AirResults.self, from: data) {
                    var temp: [String] = []
                    for element in airResults.result.records {
                        //print(element)
                        let county = element.county
                        if !temp.contains(county){
                            temp.append(county)
                            self.mainData[county] = [element]
                        }
                        else{
                            self.mainData[county]?.append(element)
                        }
                    }
                    //print(self.mainData)
                    //開始畫圖
                    self.barChartView.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 245/255, alpha: 1)
                    for element in self.countys{
                        self.aqiData.append(self.gatAverage(values:self.mainData[element]))
                    }
                    self.setChart(self.countys, values: self.aqiData)
                    self.barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: self.countys)
                    self.barChartView.xAxis.granularity = 1
                    self.barChartView.xAxis.labelPosition = .bottom
                    self.barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
                } else {
                    print("error")
                }
            }

        }
        task.resume()
        */

        barChartView.noDataText = "Could not get data for the chart."
        if let mainData = mainData{
            barChartView.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 245/255, alpha: 1)
            for element in countys{
                aqiData.append(self.gatAverage(values:mainData[element]))
            }
            setChart(self.countys, values: self.aqiData)
            barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: self.countys)
            barChartView.xAxis.granularity = 1
            barChartView.xAxis.labelPosition = .bottom
            barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? regionsTableController
        controller?.mainData = self.mainData
    }

}

