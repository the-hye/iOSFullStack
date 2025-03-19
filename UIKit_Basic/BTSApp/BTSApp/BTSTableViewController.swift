//
//  BTSTableViewController.swift
//  BTSApp
//
//  Created by Jihye Seok on 3/18/25.
//

import UIKit

class BTSTableViewController: UITableViewController {
    let fileName = "bts.plist"
    var bts: NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "BTS"
        navigationItem.rightBarButtonItem = editButtonItem
        let targetURL = urlWithFileName(fileName)
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: targetURL.path()) {
            guard let originalURL = Bundle.main.url(forResource: fileName, withExtension: nil) else { return }
            do {
                try fileManager.copyItem(at: originalURL, to: targetURL)
            } catch {
                print("복사 실패")
            }
        }
        bts = try? NSMutableArray(contentsOf: targetURL, error: ())
    }
//    override func viewWillAppear(_ animated: Bool) {
//        tableView.reloadData()
//    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bts?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bts", for: indexPath)
        guard let member = bts?[indexPath.row] as? [String: String] else { return cell }
        
        let image = cell.viewWithTag(1) as? UIImageView
        let nick = cell.viewWithTag(2) as? UILabel
        let name = cell.viewWithTag(3) as? UILabel
        let desc = cell.viewWithTag(4) as? UILabel
        if let imageView = member["image"] {
            if imageView.starts(with: "bts") {
                image?.image = UIImage(named: imageView)
            } else {
                let url = urlWithFileName(imageView)
                image?.image = UIImage(contentsOfFile: url.path())
            }
        }
        nick?.text = member["nick"]
        name?.text = member["name"]
        desc?.text = member["desc"]
        
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let bts else { return }
            
            if let member = bts[indexPath.row] as? [String: String],
                let imageName = member["image"] {
                if !imageName.starts(with: "bts") {
                        let fileURL = urlWithFileName(fileName)
                        try? FileManager.default.removeItem(at: fileURL)
                    }
                }
            
            bts.removeObject(at: indexPath.row)
            try? bts.write(to: urlWithFileName(fileName))
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            let newMember = ["nick": "보검", "name": "박보검", "desc": "보검복지부", "image": "default"]
            bts?.insert(newMember, at: indexPath.row)
            try? bts?.write(to: urlWithFileName(fileName))
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        guard let temp  = bts?[fromIndexPath.row] else { return }
        bts?.removeObject(at: fromIndexPath.row)
        bts?.insert(temp, at: to.row)
        try? bts?.write(to: urlWithFileName(fileName))
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row % 2 == 0 {
            return .delete
        } else {
            return .insert
        }
    }
    
    @IBAction func returnFromAddVC(_ unwindSegue: UIStoryboardSegue) {
        guard let bts else { return }
        let indexPath = IndexPath(row: bts.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .fade)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            guard let detailVC = segue.destination as? DetailViewController,
                  let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
            
            detailVC.member = bts?[selectedIndexPath.row] as? [String: String]
        } else {
            guard let addVC = segue.destination as? AddViewController else { return }
            addVC.bts = self.bts
        }
    }
    
    
}
