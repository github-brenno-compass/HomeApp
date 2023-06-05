//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol UsersRepositoryProtocol {

    func getUsers(
        _ request: UsersRequest
    ) async throws -> [UserListResponse]

    func searchUsers(
        _ request: SearchUsersRequest
    ) async throws -> [UserListResponse]
}

extension Container {

    public var usersRepository: Factory<UsersRepositoryProtocol> {
        self { fatalError() }
    }
}
