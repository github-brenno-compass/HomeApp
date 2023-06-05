//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation

public struct RepositoryListResponse: Hashable {

    public let id: Int
    public let name: String
    public let isPrivate: Bool
    public let url: URL
    public let description: String?
    public let language: String?
    public let starsCount: Int

    public init(
        id: Int,
        name: String,
        isPrivate: Bool,
        url: URL,
        description: String?,
        language: String?,
        starsCount: Int
    ) {
        self.id = id
        self.name = name
        self.isPrivate = isPrivate
        self.url = url
        self.description = description
        self.language = language
        self.starsCount = starsCount
    }
}
