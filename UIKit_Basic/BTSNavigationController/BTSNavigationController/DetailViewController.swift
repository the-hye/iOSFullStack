//
//  DetailViewController.swift
//  BTSNavigationController
//
//  Created by Jihye Seok on 3/14/25.
//

import UIKit

class DetailViewController: UIViewController {
    var member: [String: String]?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let member = member else { return }
        
        if let imageName = member["image"] {
            imageView.image = UIImage(named: imageName)
        }
        if let name = member["name"] {
            label.text = name
        }
    }


}
