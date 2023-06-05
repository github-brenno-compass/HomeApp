//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol UserLocalDataSource {}

extension Container {

    public var userLocalDataSource: Factory<UserLocalDataSource> {
        self { fatalError() }
    }
}
