//
//  ViewController+TableViewDataSource.swift
//  TableViewWithDictionary
//
//  Created by Jihye Seok on 3/12/25.
//

import UIKit

extension ViewController: UITableViewDataSource {
    // MARK: - UITableView Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        bts.count
        members.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifire)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifire)
        }
        let member = members[indexPath.row]
        var config = cell?.defaultContentConfiguration()
        config?.text = member.name ?? ""
        config?.textProperties.color = .orange
        config?.textProperties.font = .systemFont(ofSize: 20, weight: .bold)
        config?.secondaryText = member.desc ?? ""
        config?.secondaryTextProperties.color = .gray
        config?.secondaryTextProperties.font = .systemFont(ofSize: 15)
        config?.image = UIImage(named: member.image ?? "")
        config?.imageProperties.maximumSize = CGSize(width: 80, height: 100)
        
        cell?.contentConfiguration = config
        
        return cell!
        
    }
}
