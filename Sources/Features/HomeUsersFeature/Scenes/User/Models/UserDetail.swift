//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeDomain

private protocol UserDetailSource {

    var username: String { get }
    var avatarURL: URL { get }
    var url: URL { get }
    var company: String? { get }
    var location: String? { get }

    var optionalName: String? { get }
    var optionalBio: String? { get }
}

struct UserDetail: Hashable {

    fileprivate let source: UserDetailSource
    private let sourceHashValue: Int

    init(_ response: UserListResponse) {
        source = response
        sourceHashValue = response.hashValue
    }

    init(_ response: UserResponse) {
        source = response
        sourceHashValue = response.hashValue
    }

    static func == (_ lhs: Self, _ rhs: Self) -> Bool {
        lhs.sourceHashValue == rhs.sourceHashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(sourceHashValue)
    }
}

extension UserDetail {

    var username: String {
        source.username
    }

    var avatarURL: URL {
        source.avatarURL
    }

    var url: URL {
        source.url
    }

    var name: String? {
        source.optionalName
    }

    var bio: String? {
        source.optionalBio
    }

    var company: String? {
        source.company
    }

    var location: String? {
        source.location
    }
}

extension UserDetail {

    var toDomain: UserResponse? {
        source as? UserResponse
    }
}

extension UserListResponse: UserDetailSource {

    var company: String? {
        nil
    }

    var location: String? {
        nil
    }

    var optionalName: String? {
        nil
    }

    var optionalBio: String? {
        nil
    }
}

extension UserResponse: UserDetailSource {

    var optionalName: String? {
        name
    }

    var optionalBio: String? {
        bio
    }
}
