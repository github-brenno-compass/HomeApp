//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation

public struct SearchUsersRequest {

    public let query: String
    public let limit: Int
    public let offset: Int

    public init(
        query: String,
        limit: Int,
        offset: Int
    ) {
        self.query = query
        self.limit = limit
        self.offset = offset
    }
}
