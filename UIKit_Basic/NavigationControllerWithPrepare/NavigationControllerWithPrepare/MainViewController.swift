//
//  MainViewController.swift
//  NavigationControllerWithPrepare
//
//  Created by Jihye Seok on 3/14/25.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        guard let target = segue.destination as? TargetViewController else {
            return
        }
        // Pass the selected object to the new view controller.
        target.str = "Hello Target"
    }
}
