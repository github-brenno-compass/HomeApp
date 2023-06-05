//
//  UsersLocalDataSource.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeAppData
import SimpleKeychain

public struct UsersLocalDataSource: HomeAppData.UsersLocalDataSource {

    private let key = String(describing: Self.self)

    public init() {}
}
