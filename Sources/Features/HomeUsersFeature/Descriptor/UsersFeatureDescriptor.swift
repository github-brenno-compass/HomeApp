//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import NavigationKit
import HomeScenes

public struct UsersFeatureDescriptor: FeatureDescriptor {

    public init() {}

    public func body(content: Content) -> some View {
        content
            .nkNavigationDestination(for: UserScene.self) {
                UserCoordinator($0)
            }
            .nkNavigationDestination(for: UsersScene.self) {
                UsersCoordinator($0)
            }
            .navigationDestinationTransformer(for: UsersFeatureScene.self) {
                switch $1 {
                case .users(let scene):
                    $0(scene)
                }
            }
    }
}
