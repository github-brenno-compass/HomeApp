//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory
import HomeDomain

public struct UserRepository {

    @Injected(\.userLocalDataSource) var local
    @Injected(\.userRemoteDataSource) var remote

    public init() {}
}

extension UserRepository: UserRepositoryProtocol {

    public func getUser(_ request: UserRequest) async throws -> UserResponse {
        let request = UserRequestDTO(request)
        return try await remote.getUser(request).toDomain
    }
}
