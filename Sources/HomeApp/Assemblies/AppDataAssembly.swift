//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit
import HomeDomain
import HomeAppData
import Factory

struct AppDataAssembly: Assembly {

    func assemble(container: Container) {
        assembleUsers(container)
        assembleRepositories(container)
    }
}

// MARK: - Users

extension AppDataAssembly {

    func assembleUsers(_ container: Container) {

        container.userRepository.register {
            UserRepository()
        }

        container.usersRepository.register {
            UsersRepository()
        }
    }
}

// MARK: - Repositories

extension AppDataAssembly {

    func assembleRepositories(_ container: Container) {

        container.repositoriesRepository.register {
            RepositoriesRepository()
        }
    }
}
