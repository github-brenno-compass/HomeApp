//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import NavigationKit
import HomeScenes

public struct RepositoriesFeatureDescriptor: FeatureDescriptor {

    public init() {}

    public func body(content: Content) -> some View {
        content
            .nkNavigationDestination(for: RepositoriesScene.self) {
                RepositoriesCoordinator($0)
            }
            .navigationDestinationTransformer(for: RepositoriesFeatureScene.self) {
                switch $1 {
                case .repositories(let scene):
                    $0(scene)
                }
            }
    }
}
