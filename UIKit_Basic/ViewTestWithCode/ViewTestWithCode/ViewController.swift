//
//  ViewController.swift
//  ViewTestWithCode
//
//  Created by Jihye Seok on 3/10/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let uiView = UIView() // RootView
        uiView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        
        let color = UIColor(red: 0.4, green: 0.5, blue: 0.8, alpha: 1)
        uiView.backgroundColor = color
        
        let size = CGSize(width: 100, height: 100)
        let origin = CGPoint(x: 200, y: 100)
        let rect = CGRect(origin: origin, size: size)
        let uiView2 = UIView(frame: rect)
        uiView2.backgroundColor = UIColor.gray
        view.addSubview(uiView)
        view.addSubview(uiView2)
        
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 500, width: 300, height: 100)
        label.backgroundColor = .cyan
        label.text = "Hello, World!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        view.addSubview(label)
        
    }
}

