//
//  RepositoriesLocalDataSource.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeAppData
import SimpleKeychain

public struct RepositoriesLocalDataSource: HomeAppData.RepositoriesLocalDataSource {

    private let key = String(describing: Self.self)

    public init() {}
}
