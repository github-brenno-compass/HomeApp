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

public struct RepositoriesFeatureResolver: FeatureResolver {

    private let scene: RepositoriesFeatureScene

    public init(_ scene: RepositoriesFeatureScene) {
        self.scene = scene
    }

    public var body: some View {
        switch scene {
        case .repositories(let scene):
            RepositoriesCoordinator(scene)
        }
    }
}
