//
//  UserLocalDataSource.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeAppData
import SimpleKeychain

public struct UserLocalDataSource: HomeAppData.UserLocalDataSource {

    private let key = String(describing: Self.self)

    public init() {}
}
