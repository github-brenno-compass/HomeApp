//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol RepositoriesRepositoryProtocol {

    func getRepositories(
        _ request: RepositoriesRequest
    ) async throws -> [RepositoryListResponse]
}

extension Container {

    public var repositoriesRepository: Factory<RepositoriesRepositoryProtocol> {
        self { fatalError() }
    }
}
