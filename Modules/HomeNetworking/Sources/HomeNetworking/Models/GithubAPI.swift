//
//  GithubAPI.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit
import Factory
import RequestDL

struct GithubAPI: @unchecked Sendable, Property {

    // Factory library still not updated to Sendable protocol
    @Injected(\.globalGetAuthorizationTokenUseCase) var getAuthorizationTokenUseCase

    let method: HTTPMethod

    init(_ method: HTTPMethod) {
        self.method = method
    }

    var body: some Property {
        BaseURL("api.github.com")
        RequestMethod(method)

        AcceptHeader(.githubJSON)
        CustomHeader(
            name: "User-Agent",
            value: Bundle.main.bundleIdentifier ?? ProcessInfo.processInfo.processName
        )
        CustomHeader(
            name: "X-GitHub-Api-Version",
            value: "2022-11-28"
        )

        AsyncProperty {
            let token = try getAuthorizationTokenUseCase()
            Authorization(.bearer, token: token)
        }

        SecureConnection {
            Trusts("github.com", in: .main)
        }
    }
}
