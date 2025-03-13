//
//  BTSTableViewController.swift
//  TableViewWithController
//
//  Created by Jihye Seok on 3/13/25.
//

import UIKit

class BTSTableViewController: UITableViewController {
    let bts = [["nickname":"RM", "image":"bts1", "desc":"1번째 멤버", "name": "김남준"],
    ["nickname":"진", "image":"bts2", "desc":"2번째 멤버", "name": "김석진"],
    ["nickname":"슈가", "image":"bts3", "desc":"3번째 멤버", "name": "민윤기"],
    ["nickname":"제이홉", "image":"bts4", "desc":"4번째 멤버", "name": "정호석"],
    ["nickname":"지민", "image":"bts5", "desc":"5번째 멤버", "name": "박지민"],
    ["nickname":"뷔", "image":"bts6", "desc":"6번째 멤버", "name": "김태형"],
    ["nickname":"정국", "image":"bts7", "desc":"7번째 멤버", "name": "전정국"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bts.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if let imageView1 = cell.viewWithTag(1) as? UIImageView {
            imageView1.image = UIImage(named: bts[indexPath.row]["image"] ?? "")
        }
        if let nicknameLabel = cell.viewWithTag(2) as? UILabel {
            nicknameLabel.text = bts[indexPath.row]["nickname"]
            nicknameLabel.textColor = .magenta
        }
        if let logo = cell.viewWithTag(3) as? UIImageView {
            logo.image = UIImage(named: "bts-icon")
        }
        if let descLabel = cell.viewWithTag(4) as? UILabel {
            descLabel.text = bts[indexPath.row]["desc"]
            descLabel.textColor = .gray
        }
        if let nameLabel = cell.viewWithTag(5) as? UILabel {
            nameLabel.text = bts[indexPath.row]["name"]
            nameLabel.textColor = .blue
            nameLabel.font = .systemFont(ofSize: 15, weight: .light)
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
