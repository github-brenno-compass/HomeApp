//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeDomain

struct Repository {

    fileprivate let model: RepositoryListResponse

    init(_ model: RepositoryListResponse) {
        self.model = model
    }
}

extension Repository: Identifiable {

    var id: Int {
        model.id
    }

    var url: URL {
        model.url
    }

    var name: String {
        model.name
    }

    var description: String {
        model.description ?? ""
    }

    var language: String? {
        model.language
    }

    var stars: Int {
        model.starsCount
    }

    var isPublic: Bool {
        !model.isPrivate
    }
}

extension Repository {

    var toDomain: RepositoryListResponse {
        model
    }
}
