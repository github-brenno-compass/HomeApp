//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit

public enum RepositoriesFeatureScene {

    case repositories(Repositories)
}

extension RepositoriesFeatureScene: Hashable {

    public func hash(into hasher: inout Hasher) {
        switch self {
        case .repositories(let scene):
            scene.hash(into: &hasher)
        }
    }
}

extension RepositoriesFeatureScene {

    public struct Repositories: Hashable {

        public let username: String

        public init(_ username: String) {
            self.username = username
        }
    }
}
