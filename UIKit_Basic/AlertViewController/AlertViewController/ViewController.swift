//
//  ViewController.swift
//  AlertViewController
//
//  Created by Jihye Seok on 3/17/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnThird(_ sender: Any) {
        let alert = UIAlertController(title: "Alert Title", message: "~선택하셈.", preferredStyle: .actionSheet)
        let actionOK = UIAlertAction(title: "확인", style: .default) { _ in
            print("확인")
        }
        let actionDel = UIAlertAction(title: "삭제", style: .destructive) { _ in 
            print("삭제")
        }
        let actionCancel = UIAlertAction(title: "취소", style: .default)
        alert.addAction(actionOK)
        alert.addAction(actionDel)
        alert.addAction(actionCancel)
        present(alert, animated: true)
    }
    @IBAction func btnSecond(_ sender: Any) {
        let alert = UIAlertController(title: "Alert Title", message: "~할래 말래 할래말래.", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "확인", style: .default)
        let actionCancel = UIAlertAction(title: "취소", style: .destructive)
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        present(alert, animated: true)
    }
    @IBAction func btnFirst(_ sender: Any) {
        let alert = UIAlertController(title: "Alert Title", message: "~을 알려드립니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

