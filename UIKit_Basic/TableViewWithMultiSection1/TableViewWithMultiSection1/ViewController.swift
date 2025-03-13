//
//  ViewController.swift
//  TableViewWithMultiSection1
//
//  Created by Jihye Seok on 3/13/25.
//

import UIKit
// 이미지 닉네임 , 이미지 이름
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let nicks = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    let names = ["김남준", "김석진", "민윤기", "정호석", "박지민", "김태형", "전정국"]
    let images = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    // MARK: section별 header
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "닉네임"
//        } else {
//            return "이름"
//        }
//    }
    // MARK: sectioin별 footer
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "닉네임 끝"
        } else {
            return "이름 끝"
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return nicks.count
        } else {
            return names.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.image = UIImage(named: images[indexPath.row])
        if indexPath.section == 0 {
            config.text = nicks[indexPath.row]
            config.textProperties.color = .brown
        } else {
            config.text = names[indexPath.row]
            config.textProperties.color = .blue
        }
        cell.contentConfiguration = config
        return cell
    }
}

// MARK: - TableView Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIImageView()
        
        if section == 0 {
            header.image = UIImage(named: "qa")
        } else {
            header.image = UIImage(named: "kr")
        }
        
        return header
    }
}
