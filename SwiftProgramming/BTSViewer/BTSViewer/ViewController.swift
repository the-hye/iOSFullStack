//
//  ViewController.swift
//  BTSViewer
//
//  Created by Jihye Seok on 3/7/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var label: UILabel!
    
    let images = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7", ]
    var bts = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = images.count
        displayImage()
    }

    @IBAction func actNext(_ sender: Any) {
        index += 1
        
        if index > 6 {
            index = 0
        }
        displayImage()
    }
    
    @IBAction func actBefore(_ sender: Any) {
        index -= 1
        
        if index < 0 {
            index = 6
        }
        displayImage()
    }
    
    func displayImage() {
        pageControl.currentPage = index
        let image = UIImage(named: images[index])
        label.text = bts[index]
        imageView.image = image
    }
}

