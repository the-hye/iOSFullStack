//
//  CampingTableViewController.swift
//  XMLCampingApp
//
//  Created by Jihye Seok on 4/2/25.
//

import UIKit

class CampingTableViewController: UITableViewController {
    var items: [[String: String]] = []
    var item: [String: String] = [:]
    var key: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        search()
    }
    
    func search() {
        let endPoint = "https://apis.data.go.kr/B551011/GoCamping/basedList?serviceKey=\(apiKey)&MobileOS=iOS&MobileApp=AppTest"
        
        guard let url = URL(string: endPoint) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "No Error")")
                return
            }
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
            print(data)
            
        }.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let camp: [String: String] = items[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = camp["lineIntro"]
        cell.contentConfiguration = config
        return cell
    }
}

extension CampingTableViewController: XMLParserDelegate {
    func parserDidStartDocument(_ parser: XMLParser) {
        print("Start Parsing")
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "items" {
            items = []
        } else if elementName == "item" {
            item = [:]
        } else {
            key = elementName
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if let key {
            item[key] = string
            self.key = nil
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "items" {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } else if elementName == "item" {
            items.append(item)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        print(item)
    }
}
