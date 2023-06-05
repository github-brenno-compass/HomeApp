//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit

public enum UsersFeatureScene {

    case users(Users)
}

extension UsersFeatureScene: Hashable {

    public func hash(into hasher: inout Hasher) {
        switch self {
        case .users(let scene):
            scene.hash(into: &hasher)
        }
    }
}

extension UsersFeatureScene {

    public typealias Users = HomeAppScene.Home
}
