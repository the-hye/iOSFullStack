//
//  ViewController.swift
//  SegueIdentifier
//
//  Created by Jihye Seok on 3/17/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGreen" {
            let vc = segue.destination as? GreenViewController
            vc?.greenText = "Green Zone"
        } else {
            let vc = segue.destination as? OrangeViewController
            vc?.orangeText = "Orange Zone"
        }
    }
}

