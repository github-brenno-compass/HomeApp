//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory
import HomeDomain

public struct UsersRepository {

    @Injected(\.usersLocalDataSource) var local
    @Injected(\.usersRemoteDataSource) var remote

    public init() {}
}

extension UsersRepository: UsersRepositoryProtocol {

    public func getUsers(_ request: UsersRequest) async throws -> [UserListResponse] {
        let request = UsersRequestDTO(request)
        return try await remote.getUsers(request).map(\.toDomain)
    }

    public func searchUsers(_ request: SearchUsersRequest) async throws -> [UserListResponse] {
        let request = SearchUsersRequestDTO(request)
        return try await remote.searchUsers(request).map(\.toDomain)
    }
}
