//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol UserRemoteDataSource {

    func getUser(_ request: UserRequestDTO) async throws -> UserResponseDTO
}

extension Container {

    public var userRemoteDataSource: Factory<UserRemoteDataSource> {
        self { fatalError() }
    }
}
