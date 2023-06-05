//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol RepositoriesLocalDataSource {}

extension Container {

    public var repositoriesLocalDataSource: Factory<RepositoriesLocalDataSource> {
        self { fatalError() }
    }
}
