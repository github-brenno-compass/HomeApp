//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit
import HomeAppData
import HomeNetworking
import Factory

struct NetworkingAssembly: Assembly {

    func assemble(container: Container) {
        assembleUsers(container)
        assembleRepositories(container)
    }
}

// MARK: - Users

extension NetworkingAssembly {

    func assembleUsers(_ container: Container) {

        container.userRemoteDataSource.register {
            HomeNetworking.UserRemoteDataSource()
        }

        container.usersRemoteDataSource.register {
            HomeNetworking.UsersRemoteDataSource()
        }
    }
}

// MARK: - Repositories

extension NetworkingAssembly {

    func assembleRepositories(_ container: Container) {

        container.repositoriesRemoteDataSource.register {
            HomeNetworking.RepositoriesRemoteDataSource()
        }
    }
}
