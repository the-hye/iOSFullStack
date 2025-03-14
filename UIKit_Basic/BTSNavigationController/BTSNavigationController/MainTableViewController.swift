//
//  MainTableViewController.swift
//  BTSNavigationController
//
//  Created by Jihye Seok on 3/14/25.
//

import UIKit

class MainTableViewController: UITableViewController {
    
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
        navigationItem.title = "BTS"
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        if let imageView1 = cell.viewWithTag(1) as? UIImageView {
            imageView1.image = UIImage(named: bts[indexPath.row]["image"]!)
        }
        if let imageView2 = cell.viewWithTag(2) as? UIImageView {
            imageView2.image = UIImage(named: "bts-icon")
        }
        if let labelNick = cell.viewWithTag(3) as? UILabel {
            labelNick.text = bts[indexPath.row]["nickname"]
            labelNick.textColor = .systemBlue
            labelNick.font = .systemFont(ofSize: 20, weight: .bold)
        }
        if let labelName = cell.viewWithTag(4) as? UILabel {
            labelName.text = bts[indexPath.row]["name"]
            labelName.textColor = .gray
            labelName.font = .systemFont(ofSize: 14)
        }
        if let labelDesc = cell.viewWithTag(5) as? UILabel {
            labelDesc.text = bts[indexPath.row]["desc"]
            labelDesc.textColor = .magenta
            labelDesc.font = .systemFont(ofSize: 14)
        }
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let targetVC = segue.destination as? DetailViewController,
              let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        
        targetVC.member = bts[selectedIndexPath.row]
    }
}
