//
//  ViewController.swift
//  Plist
//
//  Created by Jihye Seok on 3/17/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "bts", withExtension: "plist")!
        print(url)
    }
}

