//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeDomain

public struct RepositoriesRequestDTO {

    public let username: String
    public let limit: Int
    public let offset: Int

    public init(_ request: RepositoriesRequest) {
        self.username = request.username
        self.limit = request.limit
        self.offset = request.offset
    }
}
