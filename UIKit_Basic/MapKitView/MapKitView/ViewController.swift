//
//  ViewController.swift
//  MapKitView
//
//  Created by Jihye Seok on 3/20/25.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = CLLocationCoordinate2D(latitude: 37.494601, longitude: 127.027584)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let pin = CustomAnnotation(coordinate: location, title: "iOS 앱 개발 과정", subtitle: "비트컴퓨터", thumbnail: "Image", strURL: "https://www.naver.com/")
        mapView.addAnnotation(pin)
        mapView.delegate = self
    }

    @IBAction func segment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            break
        }
    }
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? CustomAnnotation else { return nil }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin") as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            let imageView = UIImageView(image: UIImage(named: annotation.thumbnail))
            imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            imageView.contentMode = .scaleAspectFit
            annotationView?.leftCalloutAccessoryView = imageView
            annotationView?.canShowCallout = true
        }
        annotationView?.annotation = annotation
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = view.annotation as? CustomAnnotation else { return }
        print(annotation.title ?? "")
        print(annotation.strURL)
        
        guard let targetVC = storyboard?.instantiateViewController(identifier: "web") as? WebViewController else { return }
        targetVC.url = URL(string: annotation.strURL)
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
}
