//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import HomeScenes
import NavigationKit
import GithubKit
import Factory
import ComposableArchitecture

struct UserCoordinator: Coordinator {

    @Environment(\.navigationAction) var navigationAction
    @Environment(\.sceneAction) var sceneAction

    let scene: UserScene

    init(_ scene: UserScene) {
        self.scene = scene
    }

    var body: some View {
        ObjectConnection(scene, \.store) {
            WithViewStore($0) { viewStore in
                UserView(viewStore: viewStore)
                    .onReceive(viewStore.transaction.publisher) {
                        switch $0 {
                        case .error(let error):
                            openError(error)
                        case .repositories(let scene):
                            openRepositoriesScene(scene)
                        case .back:
                            backScene()
                        }
                    }
            }
        }
    }
}

extension UserCoordinator {

    func openError(_ error: Error) {
        sceneAction(AuthenticationAppAction.error(
            AuthenticationAppAction.Failure(error)
        ))
    }

    func openRepositoriesScene(_ scene: RepositoriesFeatureScene.Repositories) {
        navigationAction.append(RepositoriesFeatureScene.repositories(scene))
    }

    func backScene() {
        navigationAction.removeIncluding(scene)
    }
}
