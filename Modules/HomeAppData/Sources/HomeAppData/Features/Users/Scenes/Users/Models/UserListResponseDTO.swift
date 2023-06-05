//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeDomain

public struct UserListResponseDTO: Decodable {

    public let id: Int
    public let username: String
    public let avatarURL: URL
    public let url: URL
}

extension UserListResponseDTO {

    enum CodingKeys: String, CodingKey {
        case id
        case username = "login"
        case avatarURL = "avatar_url"
        case url = "html_url"
    }
}

extension UserListResponseDTO {

    public var toDomain: UserListResponse {
        UserListResponse(
            id: id,
            username: username,
            avatarURL: avatarURL,
            url: url
        )
    }
}
