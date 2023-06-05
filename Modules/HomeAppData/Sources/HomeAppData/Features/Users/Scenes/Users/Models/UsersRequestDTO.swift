//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeDomain

public struct UsersRequestDTO {

    public let limit: Int
    public let since: Int?

    public init(_ request: UsersRequest) {
        self.limit = request.limit
        self.since = request.since
    }
}
