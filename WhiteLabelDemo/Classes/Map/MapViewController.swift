//
//  MapViewController.swift
//  WhiteLabelDemo
//
//  Created by Pivulski, Nikolai on 26.05.21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    override func loadView() {
        let coordinate = CLLocationCoordinate2D(latitude: 53.8843138, longitude: 27.3131922)
        let mapView = MKMapView(frame: .zero)
        mapView.setCenter(coordinate, animated: false)
        view = mapView
    }

}
