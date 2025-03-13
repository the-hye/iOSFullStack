//
//  ViewController.swift
//  TableViewWithMultiSection
//
//  Created by Jihye Seok on 3/13/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let nicks = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    let names = ["김남준", "김석진", "민윤기", "정호석", "박지민", "김태형", "전정국"]
    let images = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
}

// MARK: - TableView Datasource Extension
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nicks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paper", for: indexPath)
        var config = cell.defaultContentConfiguration()
        
        if indexPath.section == 0 {
            config.text = nicks[indexPath.row]
        } else {
            config.text = names[indexPath.row]
        }
//        config.text = "\(indexPath.section)번째 section \(indexPath.row)번째 row"
        
        cell.contentConfiguration = config
        return cell
    }
    
    // MARK: - 스토리보드에서 Cell 추가
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "paper", for: indexPath)
//        var config = cell.defaultContentConfiguration()
//        
//        // MARK: nicks properties
//        config.text = nicks[indexPath.row]
//        config.textProperties.color = .brown
//        config.textProperties.alignment = .natural
//        config.textProperties.font = .boldSystemFont(ofSize: 20)
//        
//        // MARK: names properties
//        config.secondaryText = names[indexPath.row]
//        config.secondaryTextProperties.color = .label
//        config.secondaryTextProperties.alignment = .natural
//        
//        // MARK: images properties
//        let imageName = images[indexPath.row]
//        config.image = UIImage(named: imageName)
//        config.imageProperties.cornerRadius = 20
//        
//        cell.contentConfiguration = config
//        return cell
//    }
    
    // MARK: - UITableViewCell? 재활용
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        var cell = tableView.dequeueReusableCell(withIdentifier: "paper")
    //        if cell == nil {
    //            cell = UITableViewCell(style: .default, reuseIdentifier: "paper")
    //        }
    //
    //        var config = cell?.defaultContentConfiguration()
    //
    //        // MARK: nicks properties
    //        config?.text = nicks[indexPath.row]
    //        config?.textProperties.color = .brown
    //        config?.textProperties.alignment = .natural
    //        config?.textProperties.font = .boldSystemFont(ofSize: 20)
    //
    //        // MARK: names properties
    //        config?.secondaryText = names[indexPath.row]
    //        config?.secondaryTextProperties.color = .label
    //        config?.secondaryTextProperties.alignment = .natural
    //
    //        // MARK: images properties
    //        let imageName = images[indexPath.row]
    //        config?.image = UIImage(named: imageName)
    //        config?.imageProperties.cornerRadius = 20
    //
    //        cell?.contentConfiguration = config
    //
    //        return cell!
    //    }
    
    // MARK: - 재활용 불가 코드
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = UITableViewCell()
    //
    //        var config = cell.defaultContentConfiguration()
    //
    //        // MARK: nicks properties
    //        config.text = nicks[indexPath.row]
    //        config.textProperties.color = .brown
    //        config.textProperties.alignment = .natural
    //        config.textProperties.font = .boldSystemFont(ofSize: 20)
    //
    //        // MARK: names properties
    //        config.secondaryText = names[indexPath.row]
    //        config.secondaryTextProperties.color = .label
    //        config.secondaryTextProperties.alignment = .natural
    //
    //        // MARK: images properties
    //        let imageName = images[indexPath.row]
    //        config.image = UIImage(named: imageName)
    //        config.imageProperties.cornerRadius = 20
    //
    //        cell.contentConfiguration = config
    //        return cell
    //    }
    
    
}
