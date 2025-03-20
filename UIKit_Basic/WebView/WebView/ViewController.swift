//
//  ViewController.swift
//  WebView
//
//  Created by Jihye Seok on 3/20/25.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func google(_ sender: Any) {
        if let url = URL(string: "https://www.google.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    @IBAction func naver(_ sender: Any) {
        if let url = URL(string: "https://www.naver.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    @IBAction func daum(_ sender: Any) {
        if let url = URL(string: "https://www.daum.net") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

