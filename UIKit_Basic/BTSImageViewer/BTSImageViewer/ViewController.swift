//
//  ViewController.swift
//  BTSImageViewer
//
//  Created by Jihye Seok on 3/11/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    var bts1 = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    var images = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    var current = 0 {
        didSet {
            displayImage()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        displayImage()
    }
    
    func displayImage() {
        btnNext.isEnabled = true
        btnPrev.isEnabled = true
        
        if current >= images.count - 1 {
            btnNext.isEnabled = false
        }
        if current == 0 {
            btnPrev.isEnabled = false
        }
        let imageName = images[current]
        let image = UIImage(named: imageName)
        imageView.image = image
        uiLabel.text = bts1[current]
    }
    
    @IBAction func prevAction(_ sender: Any) {
        current -= 1
    }
    
    @IBAction func nextAction(_ sender: Any) {
        current += 1
    }
}

