//
//  LaunchDarklyManager.swift
//  WhiteLabelDemo
//
//  Created by Pivulski, Nikolai on 27.05.21.
//

import Foundation
import LaunchDarkly

protocol LaunchDarklyManagerDelegate: AnyObject {
    func flagChanged()
}

class LaunchDarklyManager {

    weak var delegate: LaunchDarklyManagerDelegate?
    let showCameraButtonKey = "show-camera-button"

    var showCameraButton: Bool {
        LDClient.get()?.variation(forKey: showCameraButtonKey) ?? false
    }

    init() {
        setup()
    }

    func setup() {
        guard let mobileKey: String = AppConfig.settingsDictionaryValue(for: "LAUNCH_DARKLY_KEY") else {
            return
        }

        let config = LDConfig(mobileKey: mobileKey)
        LDClient.start(config: config, user: nil)

        LDClient.get()?.observe(key: showCameraButtonKey, owner: self) { [weak self] _ in
            self?.delegate?.flagChanged()
        }
    }
}
