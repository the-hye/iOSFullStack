//
//  ViewController.swift
//  TableViewReusable
//
//  Created by Jihye Seok on 3/12/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        // UITableViewCell nil 체크
//        guard let cell1 = cell else {
//            return UITableViewCell()
//        }
        
        var config = cell?.defaultContentConfiguration()
        config?.text = "Hello, \(indexPath.row)"
        cell?.contentConfiguration = config
        return cell!
    }

}

