//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol UsersLocalDataSource {}

extension Container {

    public var usersLocalDataSource: Factory<UsersLocalDataSource> {
        self { fatalError() }
    }
}
