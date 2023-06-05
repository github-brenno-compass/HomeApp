//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeAppData
import RequestDL
import Factory
import GithubKit

public struct UsersRemoteDataSource: HomeAppData.UsersRemoteDataSource {

    public init() {}

    public func getUsers(_ request: UsersRequestDTO) async throws -> [UserListResponseDTO] {
        try await DataTask {
            GithubAPI(.get)

            Path("users")

            Query(
                name: "per_page",
                value: request.limit
            )

            if let since = request.since {
                Query(
                    name: "since",
                    value: since
                )
            }
        }
        .logInConsole(true)
        .logoutErrorWhenTokenExpires()
        .extractPayload()
        .decode([UserListResponseDTO].self)
        .result()
    }

    public func searchUsers(_ request: SearchUsersRequestDTO) async throws -> [UserListResponseDTO] {
        try await DataTask {
            GithubAPI(.get)

            Path("search/users")

            Query(
                name: "q",
                value: request.query
            )

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
        .keyPath(\.items)
        .decode([UserListResponseDTO].self)
        .result()
    }
}
