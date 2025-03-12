//
//  ViewController.swift
//  LottoPickerView
//
//  Created by Jihye Seok on 3/12/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var lottoButton: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    
    var lottoNumber: [Int] = Array(repeating: 0, count: 6)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        lottoButton.setTitle("번호 생성", for: .normal)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 6
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(lottoNumber[component])"
    }
    
    func lotto() -> [Int] {
        var numbers: Set<Int> = []
        while numbers.count < 6 {
            numbers.insert(Int(arc4random() % 45 + 1))
        }
        return Array(numbers).sorted()
    }
    
    @IBAction func lottoGenerate(_ sender: Any) {
        lottoNumber = lotto()
        picker.reloadAllComponents()
    }
}

