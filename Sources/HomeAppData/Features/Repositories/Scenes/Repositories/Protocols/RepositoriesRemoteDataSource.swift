//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol RepositoriesRemoteDataSource {

    func getRepositories(
        _ request: RepositoriesRequestDTO
    ) async throws -> [RepositoryListResponseDTO]
}

extension Container {

    public var repositoriesRemoteDataSource: Factory<RepositoriesRemoteDataSource> {
        self { fatalError() }
    }
}
