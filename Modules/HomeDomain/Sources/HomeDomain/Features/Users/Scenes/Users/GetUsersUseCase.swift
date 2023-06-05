//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol GetUsersUseCaseProtocol {

    func callAsFunction(
        _ request: UsersRequest
    ) async throws -> [UserListResponse]
}

public struct GetUsersUseCase {

    @Injected(\.usersRepository) var repository

    public init() {}
}

extension GetUsersUseCase: GetUsersUseCaseProtocol {

    public func callAsFunction(
        _ request: UsersRequest
    ) async throws -> [UserListResponse] {
        try await repository.getUsers(request)
    }
}

extension Container {

    public var getUsersUseCase: Factory<GetUsersUseCaseProtocol> {
        self { GetUsersUseCase() }
    }
}
