//
//  ViewController.swift
//  ViewTestWithStoryboard2
//
//  Created by Jihye Seok on 3/11/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var uiLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segment.insertSegment(withTitle: "Fifth", at: 4, animated: true)
        segment.setEnabled(false, forSegmentAt: 2)
        segment.selectedSegmentIndex = 1
        
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.tintColor = .yellow
        
        switch1.isOn = false
        uiImage.image = UIImage(systemName: "bolt")
        uiImage.tintColor = .orange
        
        stepper.stepValue = 0.5
        stepper.maximumValue = 10
        stepper.minimumValue = 0
    }


    @IBAction func segmentChanged(_ sender: Any) {
        let selected = segment.selectedSegmentIndex
        print("\(selected)번째 segment가 선택되었습니다.")
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        let current = sender.value
        print("슬라이더의 현재값은 \(current)입니다.")
    }
    @IBAction func switchChanged(_ sender: Any) {
        if switch1.isOn {
            uiImage.image = UIImage(systemName: "bolt.fill")
        } else {
            uiImage.image = UIImage(systemName: "bolt")
        }
    }
    @IBAction func stepperChanged(_ sender: Any) {
        uiLabel.text = "\(stepper.value)"
    }
}

