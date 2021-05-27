//
//  Logger.swift
//  WhiteLabelDemo
//
//  Created by Pivulski, Nikolai on 26.05.21.
//

import CustomLogger

class Logger {

    static var useCustomLogger: Bool {
        return AppConfig.settingsDictionaryValue(for: "USE_CUSTOM_LOGGER") ?? false
    }

    static func log(_ text: String) {
        if useCustomLogger {
            CustomLogger.log(text)
        } else {
            print(text)
        }
    }

}
