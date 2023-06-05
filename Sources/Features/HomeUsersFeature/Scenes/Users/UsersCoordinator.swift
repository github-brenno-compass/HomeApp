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

struct UsersCoordinator: Coordinator {

    @Environment(\.navigationAction) var navigationAction
    @Environment(\.sceneAction) var sceneAction

    let scene: UsersScene

    init(_ scene: UsersScene) {
        self.scene = scene
    }

    var body: some View {
        ObjectConnection(scene, \.store) {
            WithViewStore($0) { viewStore in
                UsersView(viewStore: viewStore)
                    .onReceive(viewStore.transaction.publisher) {
                        switch $0 {
                        case .error(let error):
                            openError(error)
                        case .logout:
                            logout()
                        case .user(let scene):
                            openUserScene(scene)
                        }
                    }
            }
        }
    }
}

extension UsersCoordinator {

    func openError(_ error: Error) {
        sceneAction(AuthenticationAppAction.error(
            AuthenticationAppAction.Failure(error)
        ))
    }

    func logout() {
        sceneAction(AuthenticationAppAction.logout(
            AuthenticationAppAction.Logout()
        ))
    }

    func openUserScene(_ scene: UserScene) {
        navigationAction.append(scene)
    }
}
