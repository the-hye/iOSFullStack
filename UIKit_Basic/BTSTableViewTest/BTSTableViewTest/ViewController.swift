//
//  ViewController.swift
//  BTSTableViewTest
//
//  Created by Jihye Seok on 3/12/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let nickNames = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    var names = ["김남준", "김석진", "민윤기", "정호석", "박지민", "김태형", "전정국"]
    let images = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    // MARK: UITableView Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nickNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "bts")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "bts")
        }
        
        var config = cell?.defaultContentConfiguration()
        // primary Label
        config?.text = nickNames[indexPath.row]
        config?.textProperties.color = .blue
        config?.textProperties.font = .systemFont(ofSize: 20, weight: .bold)
        // secondary Label
        config?.secondaryText = names[indexPath.row]
        config?.secondaryTextProperties.color = .gray
        config?.secondaryTextProperties.font = .systemFont(ofSize: 14)
        // image
        config?.image = UIImage(named: images[indexPath.row])
        config?.imageProperties.maximumSize = CGSize(width: 80, height: 100)
        cell?.contentConfiguration = config
        
        return cell!
    }

}

