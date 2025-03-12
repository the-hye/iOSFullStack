//
//  ViewController.swift
//  PickerViewTest
//
//  Created by Jihye Seok on 3/11/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var picker: UIPickerView!
    var bts1 = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    var bts2 = ["김남준", "김석진", "민윤기", "정호석", "박지민", "김태형", "전정국"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return bts1.count
        } else {
            return bts2.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return bts1[row]
        } else {
            return bts2[row]
        }
    }
}

