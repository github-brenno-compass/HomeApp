//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation

public struct RepositoriesRequest {

    public let username: String
    public let limit: Int
    public let offset: Int

    public init(
        username: String,
        limit: Int,
        offset: Int
    ) {
        self.username = username
        self.limit = limit
        self.offset = offset
    }
}
