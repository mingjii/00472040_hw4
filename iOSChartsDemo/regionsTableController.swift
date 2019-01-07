//
//  regionsTableController.swift
//  iOSChartsDemo
//
//  Created by User07 on 2019/1/7.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import UIKit


class regionsTableController: UITableViewController {
    var mainData: [String:[AirData]]?
    var countys: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        countys = ["連江縣", "金門縣", "澎湖縣", "基隆市", "宜蘭縣", "新北市", "臺北市", "桃園市", "新竹市", "新竹縣", "苗栗縣", "南投縣", "臺中市", "彰化縣", "雲林縣", "嘉義市", "嘉義縣", "臺南市", "高雄市", "屏東縣", "花蓮縣", "臺東縣"]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if let mainData = mainData{
            return mainData.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let mainData = mainData{
            for i in 0..<mainData.count{
                if section == i, let data = mainData[countys[i]]{
                    return data.count
                }
            }
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return countys[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "regionsCell", for: indexPath) as! regionsTableCell
        let county = countys[indexPath.section]
        if let mainData = mainData, let dataSet = mainData[county]{
            let data = dataSet[indexPath.row]
            cell.score.text = data.aQI
            cell.station.text = data.siteName
            //調整aqi數值顏色
            if let score = Double(data.aQI){
                cell.score.textColor = getAqiColor(value: score)
            }
        }

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? stationViewController
        if let section = tableView.indexPathForSelectedRow?.section, let row = tableView.indexPathForSelectedRow?.row{
            let county = countys[section]
            if let mainData = mainData, let dataSet = mainData[county]{
                    controller?.observationData = dataSet[row]
            }
        }
    }

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


//aqi指數相對應的顏色
func getAqiColor(value:Double)->UIColor{
    switch value {
    case 0..<51: return UIColor(red: 0, green: 200/255, blue: 0, alpha: 1)
    case 51..<101: return UIColor(red: 195/255, green: 195/255, blue: 1/255, alpha: 1)
    case 101..<151: return UIColor(red: 210/255, green: 110/255, blue: 20/255, alpha: 1)
    case 151..<201: return UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    default:
        return UIColor(red: 127/255, green: 1/255, blue: 127/255, alpha: 1)
    }
}
