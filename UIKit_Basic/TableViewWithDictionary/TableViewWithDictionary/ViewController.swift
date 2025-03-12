//
//  ViewController.swift
//  TableViewWithDictionary
//
//  Created by Jihye Seok on 3/12/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let reuseIdentifire = "bts"
    let bts = [["name":"RM", "image":"bts1", "desc":"1번째 멤버"],
               ["name":"진", "image":"bts2", "desc":"2번째 멤버"],
               ["name":"슈가", "image":"bts3", "desc":"3번째 멤버"],
               ["name":"제이홉", "image":"bts4", "desc":"4번째 멤버"],
               ["name":"지민", "image":"bts5", "desc":"5번째 멤버"],
               ["name":"뷔", "image":"bts6", "desc":"6번째 멤버"],
               ["name":"정국", "image":"bts7", "desc":"7번째 멤버"]]
    
    var members: [BTS] = []
    
    func initData() {
        for member in bts {
            if let name = member["name"],
               let image = member["image"],
               let desc = member["desc"] {
                let btsMember = BTS(name: name, image: image, desc: desc)
                members.append(btsMember)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        tableView.dataSource = self
    }
    
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        var cell = tableView.dequeueReusableCell(withIdentifier: "bts")
    //
    //        if cell == nil {
    //            // "cell =" 대신 return 하면 스토리보드에서 추가해줘야 함.
    //            cell = UITableViewCell(style: .default, reuseIdentifier: "bts")
    //        }
    //
    //        var config = cell?.defaultContentConfiguration()
    //        config?.text = bts[indexPath.row]["name"] ?? ""
    //        config?.textProperties.color = .orange
    //        config?.textProperties.font = .systemFont(ofSize: 20, weight: .bold)
    //        config?.secondaryText = bts[indexPath.row]["desc"] ?? ""
    //        config?.secondaryTextProperties.color = .gray
    //        config?.secondaryTextProperties.font = .systemFont(ofSize: 15)
    //        config?.image = UIImage(named: bts[indexPath.row]["image"] ?? "")
    //        config?.imageProperties.maximumSize = CGSize(width: 80, height: 100)
    //
    //        cell?.contentConfiguration = config
    //
    //        return cell!
    //    }
}

// MARK: - 사용자 정의 함수
func add(_ a: Int, _ b:Int) { }

// TODO: - 구현해야함
func div(_ a: Int, _ b:Int) { }

// FIXME: - 수정해야함
// ???: - 반환값이 정수인가?
func sub(_ a: Int, _ b:Int) { }

// !!!: - 반환값 타입확인
func mul(_ a: Int, _ b:Int) { }

