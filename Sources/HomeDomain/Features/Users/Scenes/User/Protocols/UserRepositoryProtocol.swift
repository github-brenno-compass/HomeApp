//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol UserRepositoryProtocol {

    func getUser(_ request: UserRequest) async throws -> UserResponse
}

extension Container {

    public var userRepository: Factory<UserRepositoryProtocol> {
        self { fatalError() }
    }
}
