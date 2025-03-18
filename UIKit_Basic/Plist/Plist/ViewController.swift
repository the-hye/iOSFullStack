//
//  ViewController.swift
//  Plist
//
//  Created by Jihye Seok on 3/17/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var bts: NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        tableView.dataSource = self
        
        let fileManager = FileManager.default
        let urls: [URL] = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = urls[0]
        print(docDir)
    }
    func initData() {
        //        let path = Bundle.main.path(forResource: "bts", ofType: "plist")
        guard let url = Bundle.main.url(forResource: "bts", withExtension: "plist") else { return }
        do {
            bts = try NSArray(contentsOf: url, error: ())
        } catch {
            print("bts.plist를 읽어오는 도중 에러 발생")
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bts", for: indexPath)
        guard let member = bts?[indexPath.row] as? [String: String] else { return cell }
        var config = cell.defaultContentConfiguration()
        if let imageName = member["image"] {
            config.image = UIImage(named: imageName)
            config.imageProperties.maximumSize = CGSize(width: 100, height: 100)
        }
        config.text = member["nick"]
        config.textProperties.font = .boldSystemFont(ofSize: 20)
        config.secondaryText = member["name"]
        config.secondaryTextProperties.color = .gray
        cell.contentConfiguration = config
        return cell
    }
    
}
