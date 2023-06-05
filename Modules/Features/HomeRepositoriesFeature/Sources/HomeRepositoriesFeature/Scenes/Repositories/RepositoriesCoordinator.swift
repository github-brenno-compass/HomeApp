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

struct RepositoriesCoordinator: Coordinator {

    @Environment(\.navigationAction) var navigationAction
    @Environment(\.sceneAction) var sceneAction

    let scene: RepositoriesScene

    init(_ scene: RepositoriesScene) {
        self.scene = scene
    }

    var body: some View {
        ObjectConnection(scene, \.store) {
            WithViewStore($0) { viewStore in
                RepositoriesView(viewStore: viewStore)
                    .onReceive(viewStore.transaction.publisher) {
                        switch $0 {
                        case .error(let error):
                            openError(error)
                        case .back:
                            backScene()
                        }
                    }
            }
        }
    }
}

extension RepositoriesCoordinator {

    func openError(_ error: Error) {
        sceneAction(AuthenticationAppAction.error(
            AuthenticationAppAction.Failure(error)
        ))
    }

    func backScene() {
        navigationAction.removeIncluding(scene)
    }
}
