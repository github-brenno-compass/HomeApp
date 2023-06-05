//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import SimpleKeychain

extension SimpleKeychain {

    public static let main = SimpleKeychain(
        service: Bundle.main.bundleIdentifier ?? ProcessInfo.processInfo.processName
    )
}
