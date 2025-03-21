//
//  MainTableViewController.swift
//  BookFinderWithAPI
//
//  Created by Jihye Seok on 3/21/25.
//

import UIKit

class MainTableViewController: UITableViewController {
    let apiURL = "https://dapi.kakao.com/v3/search/book"
    var books: [[String: Any]]?
    var page = 1 {
        didSet {
            prevButton.isEnabled = page > 1
            searchWithQuery(searchBar.text, page: page)
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var prevButton: UIBarButtonItem!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Book List"
    }
    
    func searchWithQuery(_ query: String?, page: Int) {
        guard let query else { return }
        let endPoint = "\(apiURL)?query=\(query)&page=\(page)"
        guard let url = URL(string: endPoint) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(kakaoRestAPIKey, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            guard let data else { return }
            let jsonObject = try? JSONSerialization.jsonObject(with: data)
            guard let dic = jsonObject as? [String: Any] else { return }
            self.books = dic["documents"] as? [[String: Any]]
            
            if let meta = dic["meta"] as? [String: Any],
               let isEnd = meta["is_end"] as? Bool {
                DispatchQueue.main.async {
                    self.nextButton.isEnabled = !isEnd
                }
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    @IBAction func actNext(_ sender: Any) {
        page += 1
    }
    
    @IBAction func actPrev(_ sender: Any) {
        page -= 1
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "book", for: indexPath)
        guard let books else { return cell }
        let book: [String: Any] = books[indexPath.row]
        let title = book["title"] as? String
        let publisher = book["publisher"] as? String
        let temp = book["authors"] as? [String]
        let authors = temp?.joined(separator: ", ")
        let price = book["price"] as? Int
        
        let imageView = cell.viewWithTag(1) as? UIImageView
        let lblTitle = cell.viewWithTag(2) as? UILabel
        let lblPublisher = cell.viewWithTag(4) as? UILabel
        let lblAuthors = cell.viewWithTag(3) as? UILabel
        let lblPrice = cell.viewWithTag(5) as? UILabel
        
        lblTitle?.text = title
        lblPublisher?.text = publisher
        lblAuthors?.text = authors
        lblPrice?.text = "\(price ?? 0)원"
        
        if let thumbnail = book["thumbnail"] as? String,
           let url = URL(string: thumbnail) {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, _, _ in
                guard let data else { return }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    imageView?.image = image
                }
            }
            task.resume()
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let targetVC = segue.destination as? WebViewController,
                let indexPath = tableView.indexPathForSelectedRow,
              let books,
              let url = books[indexPath.row]["url"] as? String else { return }
        
        targetVC.urlString = url
    }
}

extension MainTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        searchBar.resignFirstResponder()
    }
}
