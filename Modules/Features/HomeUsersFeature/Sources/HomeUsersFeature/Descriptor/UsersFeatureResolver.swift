//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import Factory
import HomeScenes
import NavigationKit
import GithubKit

public struct UsersFeatureResolver: FeatureResolver {

    @Injected(\.navigationBuilder) var navigationBuilder

    private let scene: UsersFeatureScene

    public init(_ scene: UsersFeatureScene) {
        self.scene = scene
    }

    public var body: some View {
        switch scene {
        case .users(let scene):
            navigationBuilder {
                UsersCoordinator(scene)
            }
        }
    }
}
