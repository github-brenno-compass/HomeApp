//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import GithubKit
import NavigationKit
import Factory
import HomeUsersFeature

public struct HomeAppResolver: MiniAppResolver {

    private let scene: HomeAppScene

    public init(_ scene: HomeAppScene) {
        self.scene = scene
    }

    public var body: some View {
        switch scene {
        case .home(let scene):
            UsersFeatureResolver(.users(scene))
        }
    }
}
