//
//  TargetViewController.swift
//  NavigationControllerWithPrepare
//
//  Created by Jihye Seok on 3/14/25.
//

import UIKit

class TargetViewController: UIViewController {
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    @IBOutlet weak var label: UILabel!
    var str: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = str
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
