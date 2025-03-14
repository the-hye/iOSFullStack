//
//  NationDetailViewController.swift
//  QatarWorldCup
//
//  Created by Jihye Seok on 3/14/25.
//

import UIKit

class NationDetailViewController: UIViewController {
    var nation: Nation?
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let nation = nation else { return }
        nameLabel.text = nation.name
        nameLabel.textColor = .brown
        descLabel.text = nation.description
        imageView.image = UIImage(named: nation.flag)
    }
}
