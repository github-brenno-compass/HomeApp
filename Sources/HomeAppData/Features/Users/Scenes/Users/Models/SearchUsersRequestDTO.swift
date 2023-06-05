//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeDomain

public struct SearchUsersRequestDTO {

    public let query: String
    public let limit: Int
    public let offset: Int

    public init(_ request: SearchUsersRequest) {
        self.query = request.query
        self.limit = request.limit
        self.offset = request.offset
    }
}
