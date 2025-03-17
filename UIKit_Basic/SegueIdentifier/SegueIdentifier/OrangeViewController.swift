//
//  OrangeViewController.swift
//  SegueIdentifier
//
//  Created by Jihye Seok on 3/17/25.
//

import UIKit

class OrangeViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var orangeText: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = orangeText
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
