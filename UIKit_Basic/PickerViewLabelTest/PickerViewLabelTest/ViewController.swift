//
//  ViewController.swift
//  PickerViewLabelTest
//
//  Created by Jihye Seok on 3/11/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var nickname = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    var name = ["김남준", "김석진", "민윤기", "정호석", "박지민", "김태형", "전정국"]
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return nickname.count
        } else {
            return name.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            nicknameLabel.text = nickname[row]
            return nickname[row]
        } else {
            nameLabel.text = name[row]
            return name[row]
        }
    }
}

