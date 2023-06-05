//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation

public struct UsersRequest {

    public let limit: Int
    public let since: Int?

    public init(limit: Int, since: Int?) {
        self.limit = limit
        self.since = since
    }
}
