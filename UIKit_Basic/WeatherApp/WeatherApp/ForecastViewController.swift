//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Jihye Seok on 4/1/25.
//

import UIKit

class ForecastViewController: UITableViewController {
    var forecasts: [Forecast]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getForecast(city: "seoul")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func getForecast(city: String) {
        let strURL = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&appid=\(weatherAPI)&lang=kr"
        guard let url = URL(string: strURL) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, res, error in
            if error != nil {
                return
            }
            guard let data else { return }
            let decoder = JSONDecoder()
            do {
                let forecastRoot = try decoder.decode(ForecastRoot.self, from: data)
                self.forecasts = forecastRoot.list
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(forecastRoot)
            } catch {
                print("Error decoding: \(error.localizedDescription)")
            }
        }.resume()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return forecasts?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let lblDate = cell.viewWithTag(1) as? UILabel
        let iconImage = cell.viewWithTag(2) as? UIImageView
        let lblMain = cell.viewWithTag(3) as? UILabel
        let lblDesc = cell.viewWithTag(4) as? UILabel
        let lblTemp = cell.viewWithTag(5) as? UILabel
        let lblHumid = cell.viewWithTag(6) as? UILabel
        
        guard let forecasts else { return cell }
        let forecast = forecasts[indexPath.row]
        
        lblDate?.text = forecast.strDate
        lblMain?.text = forecast.weather.first?.main
        lblDesc?.text = forecast.weather.first?.description
        lblTemp?.text = "\(forecast.factor.temp)"
        lblHumid?.text = "\(forecast.factor.humidity)%"
        
        if let icon = forecast.weather.first?.icon {
            let iconURL = "https://openweathermap.org/img/wn/\(icon)@2x.png"
            guard let url = URL(string: iconURL) else { return cell }
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, res, error in
                if let data = data {
                    DispatchQueue.main.async {
                        iconImage?.image = UIImage(data: data)
                    }
                }
            }
            .resume()
        }

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
