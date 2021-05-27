//
//  ViewController.swift
//  WhiteLabelDemo
//
//  Created by Pivulski, Nikolai on 26.05.21.
//

import UIKit

class ViewController: UIViewController {

    let featureManager = LaunchDarklyManager()

    var useGoogleMaps: Bool {
        guard let useGoogleMaps: Bool = AppConfig.settingsDictionaryValue(for: "USE_GOOGLE_MAPS") else {
            return false
        }
        return useGoogleMaps
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        featureManager.delegate = self
        setupView()
        reloadData()
    }

    func setupView() {
        // Use WLResources and Info.plist
        navigationController?.navigationBar.barTintColor = UIColor(named: "MainColor")
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = AppConfig.infoDictionaryValue(for: "CFBundleDisplayName")

        let baseURLKey = "API_BASE_URL"
        let baseURL: String = AppConfig.infoDictionaryValue(for: baseURLKey) ?? ""
        Logger.log(baseURLKey + " = " + baseURL)

        // Use Settings.plist
        let mapViewController = useGoogleMaps ? GoogleMapViewController() : MapViewController()
        add(mapViewController, to: view)
    }

    func reloadData() {
        navigationItem.rightBarButtonItem = featureManager.showCameraButton ? UIBarButtonItem(systemItem: .camera) : nil
    }
}

extension ViewController: LaunchDarklyManagerDelegate {

    func flagChanged() {
        reloadData()
    }

}
