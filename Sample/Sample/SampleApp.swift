//
//  SampleApp.swift
//  Sample
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import Factory
import GithubKit
import HomeApp

@main
struct SampleApp: App {

    init() {
        Self.start()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .viewResolver(for: HomeAppScene.self) {
                    HomeAppResolver($0)
                }
                .sceneActionEnabled()
        }
    }
}

extension SampleApp {

    @MainActor
    static func start() {
        HomeApp.start()

        Container.shared.navigationBuilder.register {
            NavigationBuilder()
        }

        Container.shared.navigationSplitBuilder.register {
            NavigationSplitBuilder()
        }

        Container.shared.globalDeleteAuthorizationTokenUseCase.register {
            GlobalDeleteAuthorizationUseCase()
        }

        Container.shared.globalGetAuthorizationTokenUseCase.register {
            GlobalGetAuthorizationTokenUseCase()
        }
    }
}
