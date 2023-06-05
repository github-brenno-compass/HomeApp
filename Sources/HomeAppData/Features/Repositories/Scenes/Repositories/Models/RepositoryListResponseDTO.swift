//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeDomain

public struct RepositoryListResponseDTO: Decodable {
    public let id: Int
    public let name: String
    public let isPrivate: Bool
    public let url: URL
    public let description: String?
    public let language: String?
    public let starsCount: Int
}

extension RepositoryListResponseDTO {

    enum CodingKeys: String, CodingKey {
        case id, name, description, language
        case isPrivate = "private"
        case url = "html_url"
        case starsCount = "stargazers_count"
    }
}

extension RepositoryListResponseDTO {

    var toDomain: RepositoryListResponse {
        RepositoryListResponse(
            id: id,
            name: name,
            isPrivate: isPrivate,
            url: url,
            description: description,
            language: language,
            starsCount: starsCount
        )
    }
}
