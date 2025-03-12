//
//  ViewController.swift
//  ViewTestWithStoryboard
//
//  Created by Jihye Seok on 3/10/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var buttonLabel: UILabel!
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }

    @IBAction func uiButton(_ sender: Any) {
        buttonLabel.font = .systemFont(ofSize: 20, weight: .medium)
        buttonLabel.textColor = .blue
        buttonLabel.textAlignment = .center
        uiView.backgroundColor = .blue
        buttonLabel.text = "파란 버튼이 눌렸다."
    }
    
    @IBAction func redButton(_ sender: Any) {
        buttonLabel.font = .systemFont(ofSize: 20, weight: .medium)
        buttonLabel.textColor = .red
        buttonLabel.textAlignment = .center
        uiView.backgroundColor = .red
        buttonLabel.text = "빨간 버튼이 눌렸다."
    }
}

