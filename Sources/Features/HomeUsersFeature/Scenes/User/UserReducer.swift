//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit
import Factory
import HomeDomain
import NavigationKit
import ComposableArchitecture

struct UserReducer: ReducerProtocol {

    struct State: Hashable {

        var detail: UserDetail

        var viewState: ViewState = .inactive
        var isLoading: Bool = false
        var isDetailLoaded = false

        let transaction = SceneTransaction<UserDestination>()

        init(_ scene: UserScene) {
            detail = .init(scene.user)
        }
    }

    enum Action {
        case viewState(ViewState)
        case loadData
        case detail(UserResponse)

        case loading(Bool)

        case error(Error)
        case back
        case repository
    }

    enum CancelID {
        case user
    }

    @Injected(\.getUserUseCase) var getUserUseCase

    var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case .viewState(let viewState):
                state.viewState = viewState

                if case .active = viewState, !state.isDetailLoaded {
                    return .send(.loadData)
                }
            case .loadData:
                return performLoadData(&state)
            case .detail(let detail):
                state.detail = .init(detail)
                state.isDetailLoaded = true
            case .loading(let isLoading):
                state.isLoading = isLoading
            case .error(let error):
                state.transaction(.error(error))
            case .back:
                state.transaction(.back)
            case .repository:
                state.transaction(.repositories(.init(state.detail.username)))
            }

            return .none
        }
    }
}

extension UserReducer {

    func performLoadData(_ state: inout State) -> EffectTask<Action> {
        .run { [state] send in
            await send(.loading(true))

            do {
                let detail = try await getUserUseCase(UserRequest(
                    username: state.detail.username
                ))
                await send(.detail(detail))
            } catch {
                await send(.error(error))
            }

            await send(.loading(false))
        }.cancellable(id: CancelID.user)
    }
}
