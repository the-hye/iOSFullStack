//
//  ViewController.swift
//  PickerViewReusingView
//
//  Created by Jihye Seok on 3/12/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    let bts = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국", "RM1", "진2", "슈가3", "제이홉4", "지민5", "뷔6", "정국7"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    // MARK: Datasource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        bts.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    // MARK: Delegate
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel?
        
        if let label1 = view {
            label = label1 as? UILabel
            label?.text = bts[row]
        }
        if view == nil {
            label = UILabel()
            label?.text = bts[row]
            label?.textAlignment = .center
        }
        return label!
    }
}

