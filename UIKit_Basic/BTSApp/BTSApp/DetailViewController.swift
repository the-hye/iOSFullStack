//
//  DetailViewController.swift
//  BTSApp
//
//  Created by Jihye Seok on 3/18/25.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var labelNick: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var member: [String: String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let member = member {
            if let imageName = member["image"] {
                imageView.image = UIImage(named: imageName)
            }
            labelName.text = member["name"]
            labelNick.text = member["nick"]
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
