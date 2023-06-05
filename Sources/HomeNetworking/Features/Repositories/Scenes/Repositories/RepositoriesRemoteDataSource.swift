//
//  RepositoriesRemoteDataSource.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeAppData
import RequestDL
import Factory
import GithubKit

public struct RepositoriesRemoteDataSource: HomeAppData.RepositoriesRemoteDataSource {

    public init() {}

    public func getRepositories(
        _ request: HomeAppData.RepositoriesRequestDTO
    ) async throws -> [HomeAppData.RepositoryListResponseDTO] {
        try await DataTask {
            GithubAPI(.get)

            Path("users/\(request.username)/repos")

            Query(
                name: "per_page",
                value: request.limit
            )

            Query(
                name: "page",
                value: request.offset
            )
        }
        .logInConsole(true)
        .logoutErrorWhenTokenExpires()
        .extractPayload()
        .replaceEmptyData(with: "[]")
        .decode([RepositoryListResponseDTO].self)
        .result()
    }
}
