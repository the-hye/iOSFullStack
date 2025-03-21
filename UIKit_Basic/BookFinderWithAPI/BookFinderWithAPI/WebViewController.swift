//
//  WebViewController.swift
//  BookFinderWithAPI
//
//  Created by Jihye Seok on 3/21/25.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var urlString: String?
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlString, let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    // Do any additional setup after loading the view.
}

