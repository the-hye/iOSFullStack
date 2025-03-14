//
//  NationTableViewController.swift
//  QatarWorldCup
//
//  Created by Jihye Seok on 3/14/25.
//

import UIKit

class NationTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return nations.keys.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = nations.keys.sorted()[section]
        return nations[key]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nations.keys.sorted()[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let key = nations.keys.sorted()[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let nationArray = nations[key] {
            let nation = nationArray[indexPath.row]
            
            if let imageView = cell.viewWithTag(1) as? UIImageView {
                imageView.image = UIImage(named: nation.flag)
            }
            if let label = cell.viewWithTag(2) as? UILabel {
                label.text = nation.name
            }
        }
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        guard let detailVC = segue.destination as? NationDetailViewController,
                let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        // Pass the selected object to the new view controller.
        detailVC.nation = nations[nations.keys.sorted()[selectedIndexPath.section]]?[selectedIndexPath.row]
    }
    
}
