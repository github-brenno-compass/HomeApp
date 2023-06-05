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

public struct UserRemoteDataSource: HomeAppData.UserRemoteDataSource {

    public init() {}

    public func getUser(_ request: UserRequestDTO) async throws -> UserResponseDTO {
        try await DataTask {
            GithubAPI(.get)
            Path("users/\(request.username)")
        }
        .logInConsole(true)
        .logoutErrorWhenTokenExpires()
        .extractPayload()
        .decode(UserResponseDTO.self)
        .result()
    }
}
