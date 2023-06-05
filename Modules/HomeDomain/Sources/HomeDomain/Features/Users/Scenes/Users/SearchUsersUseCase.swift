//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol SearchUsersUseCaseProtocol {

    func callAsFunction(
        _ request: SearchUsersRequest
    ) async throws -> [UserListResponse]
}

public struct SearchUsersUseCase {

    @Injected(\.usersRepository) var repository

    public init() {}
}

extension SearchUsersUseCase: SearchUsersUseCaseProtocol {

    public func callAsFunction(
        _ request: SearchUsersRequest
    ) async throws -> [UserListResponse] {
        try await repository.searchUsers(request)
    }
}

extension Container {

    public var searchUsersUseCase: Factory<SearchUsersUseCaseProtocol> {
        self { SearchUsersUseCase() }
    }
}
