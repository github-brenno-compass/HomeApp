//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol GetUserUseCaseProtocol {

    func callAsFunction(
        _ request: UserRequest
    ) async throws -> UserResponse
}

public struct GetUserUseCase {

    @Injected(\.userRepository) var repository

    public init() {}
}

extension GetUserUseCase: GetUserUseCaseProtocol {

    public func callAsFunction(
        _ request: UserRequest
    ) async throws -> UserResponse {
        try await repository.getUser(request)
    }
}

extension Container {

    public var getUserUseCase: Factory<GetUserUseCaseProtocol> {
        self { GetUserUseCase() }
    }
}
