//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeScenes
import ComposableArchitecture

typealias RepositoriesScene = RepositoriesFeatureScene.Repositories

extension RepositoriesScene {

    var store: StoreOf<RepositoriesReducer> {
        .init(
            initialState: .init(self),
            reducer: RepositoriesReducer()
        )
    }
}
