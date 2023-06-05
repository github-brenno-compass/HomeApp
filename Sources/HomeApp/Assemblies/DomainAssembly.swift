//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit
import HomeDomain
import Factory

struct DomainAssembly: Assembly {

    func assemble(container: Container) {
        assembleUsers(container)
        assembleRepositories(container)
    }
}

// MARK: - Users

extension DomainAssembly {

    func assembleUsers(_ container: Container) {

        container.getUsersUseCase.register {
            GetUsersUseCase()
        }

        container.getUserUseCase.register {
            GetUserUseCase()
        }

        container.searchUsersUseCase.register {
            SearchUsersUseCase()
        }
    }
}

// MARK: - Repositories

extension DomainAssembly {

    func assembleRepositories(_ container: Container) {

        container.getRepositoriesUseCase.register {
            GetRepositoriesUseCase()
        }
    }
}
