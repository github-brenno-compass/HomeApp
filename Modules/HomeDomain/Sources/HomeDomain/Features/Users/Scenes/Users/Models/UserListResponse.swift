//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation

public struct UserListResponse: Hashable {

    public let id: Int
    public let username: String
    public let avatarURL: URL
    public let url: URL

    public init(
        id: Int,
        username: String,
        avatarURL: URL,
        url: URL
    ) {
        self.id = id
        self.username = username
        self.avatarURL = avatarURL
        self.url = url
    }
}
