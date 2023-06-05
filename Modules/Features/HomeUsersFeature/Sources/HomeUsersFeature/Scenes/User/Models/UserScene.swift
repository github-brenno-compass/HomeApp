//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeDomain
import ComposableArchitecture

struct UserScene: Hashable {

    let user: UserListResponse
}

extension UserScene {

    var store: StoreOf<UserReducer> {
        .init(
            initialState: .init(self),
            reducer: UserReducer()
        )
    }
}
