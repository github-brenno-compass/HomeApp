//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeDomain

struct User: Hashable {

    fileprivate let model: UserListResponse

    init(_ model: UserListResponse) {
        self.model = model
    }
}

extension User: Identifiable {

    var id: Int {
        model.id
    }

    var url: URL {
        model.url
    }

    var username: String {
        model.username
    }

    var avatarURL: URL {
        model.avatarURL
    }
}

extension User {

    var toDomain: UserListResponse {
        model
    }
}
