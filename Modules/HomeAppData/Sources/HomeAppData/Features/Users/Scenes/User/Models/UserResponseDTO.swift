//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeDomain

public struct UserResponseDTO: Decodable {

    public let id: Int
    public let username: String
    public let avatarURL: URL
    public let url: URL
    public let name: String
    public let bio: String?
    public let company: String?
    public let location: String?
}

extension UserResponseDTO {

    enum CodingKeys: String, CodingKey {
        case id, name, bio, company, location
        case username = "login"
        case avatarURL = "avatar_url"
        case url = "html_url"
    }
}

extension UserResponseDTO {

    var toDomain: UserResponse {
        UserResponse(
            id: id,
            username: username,
            avatarURL: avatarURL,
            url: url,
            name: name,
            bio: bio,
            company: company,
            location: location
        )
    }
}
