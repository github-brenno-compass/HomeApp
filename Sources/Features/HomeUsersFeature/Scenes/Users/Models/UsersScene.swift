//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeScenes
import ComposableArchitecture

typealias UsersScene = UsersFeatureScene.Users

extension UsersScene {

    var store: StoreOf<UsersReducer> {
        .init(
            initialState: .init(self),
            reducer: UsersReducer()
        )
    }
}
