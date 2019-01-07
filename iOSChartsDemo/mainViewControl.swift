//
//  mainViewControl.swift
//  iOSChartsDemo
//
//  Created by User07 on 2019/1/7.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import UIKit

class mainViewControl: UIViewController {
    var mainData: [String:[AirData]]!

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainData = [:]
       
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

                    self.startButton.isHidden = false
                    //print(self.mainData)
                }
                else {
                    print("error")
                }
            }
            
        }
        task.resume()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? BarChartViewController
        controller?.mainData = self.mainData
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
