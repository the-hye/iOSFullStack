//
//  ViewController.swift
//  TableViewReusable(non-optional)
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
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "can", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = "\(indexPath.row)번째임!"
        cell.contentConfiguration = config
        return cell
    }
}

