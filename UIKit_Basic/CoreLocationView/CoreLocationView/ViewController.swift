//
//  ViewController.swift
//  CoreLocationView
//
//  Created by Jihye Seok on 3/20/25.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    let manager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.requestAlwaysAuthorization()
        manager.delegate = self
    }
    
    @IBAction func actLocation(_ sender: Any) {
        manager.startUpdatingLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        guard let location = locations.first else { return }
        locationLabel.numberOfLines = 0
        locationLabel.text = "위도: \(location.coordinate.latitude)\n 경도: \(location.coordinate.longitude)"
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        
    }
}
