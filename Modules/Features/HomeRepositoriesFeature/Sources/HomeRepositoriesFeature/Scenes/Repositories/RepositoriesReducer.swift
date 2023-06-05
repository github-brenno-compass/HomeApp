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

struct RepositoriesReducer: ReducerProtocol {

    typealias Page = PageReducer<Repository>

    struct State: Hashable {

        let username: String

        var viewState: ViewState = .inactive
        var page: Page.State = .init(limit: 30)

        let transaction = SceneTransaction<RepositoriesDestination>()

        init(_ scene: RepositoriesScene) {
            username = scene.username
        }
    }

    enum Action {
        case viewState(ViewState)

        case pageAction(Page.Action)

        case error(Error)
        case back
    }

    enum CancelID {
        case repositories
    }

    @Injected(\.getRepositoriesUseCase) var getRepositoriesUseCase

    var body: some ReducerProtocolOf<Self> {
        Scope(state: \.page, action: /Action.pageAction) {
            Page()
        }

        Reduce { state, action in
            switch action {
            case .viewState(let viewState):
                state.viewState = viewState
                return .send(.pageAction(.loadData))
            case .pageAction(let action):
                return performPageAction(action, in: &state)
            case .error(let error):
                state.transaction(.error(error))
            case .back:
                state.transaction(.back)
            }

            return .none
        }
    }
}

extension RepositoriesReducer {

    func performPageAction(
        _ action: Page.Action,
        in state: inout State
    ) -> EffectTask<Action> {
        switch action {
        case .barrierLoadData(let input):
            return .run { [state] send in
                do {
                    let result = try await getRepositoriesUseCase(.init(
                        username: state.username,
                        limit: input.limit,
                        offset: 1
                    ))
                    await send(.pageAction(.reset(.success(
                        result.map(Repository.init))
                    )))
                } catch {
                    await send(.pageAction(.reset(.failure(error))))
                    await send(.error(error))
                }
            }.cancellable(id: CancelID.repositories)
        case .barrierNextPage(let input):
            return .run { [state] send in
                do {
                    let result = try await getRepositoriesUseCase(.init(
                        username: state.username,
                        limit: input.limit,
                        offset: (input.offset / 30) + 1
                    ))
                    await send(.pageAction(.append(.success(
                        result.map(Repository.init))
                    )))
                } catch {
                    await send(.pageAction(.reset(.failure(error))))
                    await send(.error(error))
                }
            }
        default:
            return .none
        }
    }
}
