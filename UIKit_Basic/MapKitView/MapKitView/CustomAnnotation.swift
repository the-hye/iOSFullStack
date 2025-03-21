//
//  CustomAnnotation.swift
//  MapKitView
//
//  Created by Jihye Seok on 3/20/25.
//

import UIKit
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    let thumbnail: String
    let strURL: String
    
    init(coordinate: CLLocationCoordinate2D, title: String? = nil, subtitle: String? = nil, thumbnail: String, strURL: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.thumbnail = thumbnail
        self.strURL = strURL
    }
}
