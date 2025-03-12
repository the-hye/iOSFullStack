//
//  ViewController.swift
//  PickerViewWithView2
//
//  Created by Jihye Seok on 3/12/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    
    let bts = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    let images = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return bts.count
        } else {
            return images.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 150
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        let image = UIImageView()
        if component == 0 {
            label.text = bts[row]
            label.textAlignment = .center
            return label
        } else {
            image.image = UIImage(named: images[row])
            image.contentMode = .scaleAspectFit
            return image
        }
    }
    
}

