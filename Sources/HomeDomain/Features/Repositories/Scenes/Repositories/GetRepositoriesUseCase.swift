//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol GetRepositoriesUseCaseProtocol {

    func callAsFunction(
        _ request: RepositoriesRequest
    ) async throws -> [RepositoryListResponse]
}

public struct GetRepositoriesUseCase {

    @Injected(\.repositoriesRepository) var repository

    public init() {}
}

extension GetRepositoriesUseCase: GetRepositoriesUseCaseProtocol {

    public func callAsFunction(_ request: RepositoriesRequest) async throws -> [RepositoryListResponse] {
        try await repository.getRepositories(request)
    }
}

extension Container {

    public var getRepositoriesUseCase: Factory<GetRepositoriesUseCaseProtocol> {
        self { GetRepositoriesUseCase() }
    }
}
