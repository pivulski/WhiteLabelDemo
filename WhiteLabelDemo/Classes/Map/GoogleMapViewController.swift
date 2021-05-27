//
//  GoogleMapViewController.swift
//  WhiteLabelDemo
//
//  Created by Pivulski, Nikolai on 26.05.21.
//

#if canImport(GoogleMaps)

import UIKit
import GoogleMaps

enum GoogleMapError: Error {
    case apiKey
}

class GoogleMapViewController: UIViewController {

    private func setupSDK() throws {
        guard let googleMapsApiKey: String = AppConfig.settingsDictionaryValue(for: "GOOGLE_MAPS_API_KEY") else {
            throw GoogleMapError.apiKey
        }
        GMSServices.provideAPIKey(googleMapsApiKey)
    }

    override func loadView() {
        do {
            try setupSDK()
            let camera = GMSCameraPosition.camera(withLatitude: 53.8843138, longitude: 27.3131922, zoom: 6.0)
            let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            view = mapView
        } catch {
            view = UIView()
        }
    }

}

#else

import UIKit

class GoogleMapViewController: MapViewController {

}

#endif
