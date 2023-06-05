//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol UsersRemoteDataSource {

    func getUsers(_ request: UsersRequestDTO) async throws -> [UserListResponseDTO]

    func searchUsers(_ request: SearchUsersRequestDTO) async throws -> [UserListResponseDTO]
}

extension Container {

    public var usersRemoteDataSource: Factory<UsersRemoteDataSource> {
        self { fatalError() }
    }
}
