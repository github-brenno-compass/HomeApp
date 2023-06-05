//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation

public struct UserResponse: Hashable {

    public let id: Int
    public let username: String
    public let avatarURL: URL
    public let url: URL
    public let name: String
    public let bio: String?
    public let company: String?
    public let location: String?

    public init(
        id: Int,
        username: String,
        avatarURL: URL,
        url: URL,
        name: String,
        bio: String?,
        company: String?,
        location: String?
    ) {
        self.username = username
        self.id = id
        self.avatarURL = avatarURL
        self.url = url
        self.name = name
        self.bio = bio
        self.company = company
        self.location = location
    }
}
