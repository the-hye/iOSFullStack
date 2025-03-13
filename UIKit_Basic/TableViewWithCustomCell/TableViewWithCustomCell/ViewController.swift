//
//  ViewController.swift
//  TableViewWithCustomCell
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
        tableView.rowHeight = 100
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nicks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let imageView1 = cell.viewWithTag(1) as? UIImageView {
            let imageName = images[indexPath.row]
            imageView1.image = UIImage(named: imageName)
        }
        
        if let lblNick = cell.viewWithTag(2) as? UILabel {
            lblNick.text = nicks[indexPath.row]
            lblNick.textColor = .brown
            lblNick.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        if let lblName = cell.viewWithTag(3) as? UILabel {
            lblName.text = names[indexPath.row]
            lblName.textColor = .gray
            lblName.font = .systemFont(ofSize: 15)
        }
        
        if let imageView2 = cell.viewWithTag(4) as? UIImageView {
            imageView2.image = UIImage(named: images[indexPath.row])
        }
        return cell
    }
    
    
}
