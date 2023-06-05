//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeDomain

public struct UserRequestDTO {

    public let username: String

    public init(_ request: UserRequest) {
        self.username = request.username
    }
}
