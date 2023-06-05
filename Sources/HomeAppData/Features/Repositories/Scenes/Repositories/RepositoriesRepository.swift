//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory
import HomeDomain

public struct RepositoriesRepository {

    @Injected(\.repositoriesLocalDataSource) var local
    @Injected(\.repositoriesRemoteDataSource) var remote

    public init() {}
}

extension RepositoriesRepository: RepositoriesRepositoryProtocol {

    public func getRepositories(
        _ request: RepositoriesRequest
    ) async throws -> [RepositoryListResponse] {
        let request = RepositoriesRequestDTO(request)
        return try await remote.getRepositories(request).map(\.toDomain)
    }
}
