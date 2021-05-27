//
//  String+Utils.swift
//  WhiteLabelDemo
//
//  Created by Pivulski, Nikolai on 26.05.21.
//

import Foundation

class AppConfig {

    static func infoDictionaryValue<T>(for key: String) -> T? {
        Bundle.main.object(forInfoDictionaryKey: key) as? T
    }

    static func settingsDictionaryValue<T>(for key: String) -> T? {
        guard let url = Bundle.main.url(forResource: "Settings", withExtension: "plist"),
              let dict = NSDictionary(contentsOf: url) as? [String: Any] else {
            return nil
        }
        return dict[key] as? T
    }

}
