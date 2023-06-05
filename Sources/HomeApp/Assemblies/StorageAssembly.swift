//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit
import HomeAppData
import HomeStorage
import Factory

struct StorageAssembly: Assembly {

    func assemble(container: Container) {
        assembleUsers(container)
        assembleRepositories(container)
    }
}

// MARK: - Users

extension StorageAssembly {

    func assembleUsers(_ container: Container) {

        container.userLocalDataSource.register {
            HomeStorage.UserLocalDataSource()
        }

        container.usersLocalDataSource.register {
            HomeStorage.UsersLocalDataSource()
        }
    }
}

// MARK: - Repositories

extension StorageAssembly {

    func assembleRepositories(_ container: Container) {

        container.repositoriesLocalDataSource.register {
            HomeStorage.RepositoriesLocalDataSource()
        }
    }
}
