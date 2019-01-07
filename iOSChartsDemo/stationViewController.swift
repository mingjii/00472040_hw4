//
//  stationTableView.swift
//  iOSChartsDemo
//
//  Created by User07 on 2019/1/7.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import UIKit

class stationViewController: UITableViewController {
    var observationData: AirData?
    @IBOutlet weak var station: UILabel!
    @IBOutlet weak var aqiScore: UILabel!
    @IBOutlet weak var o3AVG: UILabel!
    @IBOutlet weak var o3: UILabel!
    @IBOutlet weak var pm25AVG: UILabel!
    @IBOutlet weak var pm25: UILabel!
    @IBOutlet weak var pm10AVG: UILabel!
    @IBOutlet weak var pm10: UILabel!
    @IBOutlet weak var coAVG: UILabel!
    @IBOutlet weak var co: UILabel!
    @IBOutlet weak var so2: UILabel!
    @IBOutlet weak var no2: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = observationData{
            station.text = data.siteName + "觀測站"
            aqiScore.text = data.aQI
            o3AVG.text = data.o38hr
            o3.text = data.o3
            pm25AVG.text = data.pM25AVG
            pm25.text = data.pM25
            pm10AVG.text = data.pM10AVG
            coAVG.text = data.cO8hr
            co.text = data.cO
            so2.text = data.sO2
            no2.text = data.nO2
            status.text = "空氣狀態：" + data.status
            if let aqiValue = Double(data.aQI){
                aqiScore.textColor = getAqiColor(value: aqiValue)
            }
        }
        
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
     */
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


