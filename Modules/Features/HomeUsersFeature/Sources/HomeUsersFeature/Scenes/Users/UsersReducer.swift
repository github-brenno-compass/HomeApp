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

struct UsersReducer: ReducerProtocol {

    typealias Page = PageReducer<User>

    struct State: Hashable {

        var viewState: ViewState = .inactive
        var page: Page.State = .init(limit: 64)

        var searchPage: Page.State = .init(limit: 32)
        var query: String = ""

        let transaction = SceneTransaction<UsersDestination>()

        init(_ scene: UsersScene) {}
    }

    enum Action {
        case viewState(ViewState)

        case pageAction(Page.Action)

        case searchAction(Page.Action)
        case queryDidChange(String)
        case resetSearch

        case error(Error)
        case logout
        case user(User)
    }

    enum CancelID {
        case repositories
        case search
    }

    @Injected(\.getUsersUseCase) var getUsersUseCase
    @Injected(\.searchUsersUseCase) var searchUsersUseCase
    @Injected(\.globalDeleteAuthorizationTokenUseCase) var deleteAuthorizationTokenUseCase

    var body: some ReducerProtocolOf<Self> {
        Scope(state: \.page, action: /Action.pageAction) {
            Page()
        }

        Scope(state: \.searchPage, action: /Action.searchAction) {
            Page()
        }

        Reduce { state, action in
            switch action {
            case .viewState(let viewState):
                state.viewState = viewState
                return .send(.pageAction(.loadData))
            case .pageAction(let action):
                return performPageAction(action, in: &state)
            case .searchAction(let action):
                return performSearchAction(action, in: &state)
            case .queryDidChange(let query):
                state.query = query
                return queryDebounce(query)
            case .resetSearch:
                state.searchPage = .init(limit: 64)
                return .send(.searchAction(.loadData))
            case .error(let error):
                state.transaction(.error(error))
            case .logout:
                try? deleteAuthorizationTokenUseCase()
                state.transaction(.logout)
            case .user(let user):
                state.transaction(.user(.init(user: user.toDomain)))
            }

            return .none
        }
    }
}

extension UsersReducer {

    func performPageAction(
        _ action: Page.Action,
        in state: inout State
    ) -> EffectTask<Action> {
        switch action {
        case .barrierLoadData(let input):
            return .run { send in
                do {
                    let result = try await getUsersUseCase(.init(
                        limit: input.limit,
                        since: nil
                    ))
                    await send(.pageAction(.reset(.success(
                        result.map(User.init))
                    )))
                } catch {
                    await send(.pageAction(.reset(.failure(error))))
                    await send(.error(error))
                }
            }.cancellable(id: CancelID.repositories)
        case .barrierNextPage(let input):
            return .run { [state] send in
                do {
                    let result = try await getUsersUseCase(.init(
                        limit: input.limit,
                        since: state.page.items.last?.id
                    ))
                    await send(.pageAction(.append(.success(
                        result.map(User.init))
                    )))
                } catch {
                    await send(.pageAction(.reset(.failure(error))))
                    await send(.error(error))
                }
            }.cancellable(id: CancelID.repositories)
        default:
            return .none
        }
    }
}

extension UsersReducer {

    func queryDebounce(_ query: String) -> EffectTask<Action> {
        .send(.resetSearch).debounce(
            id: CancelID.search,
            for: 0.5,
            scheduler: DispatchQueue.main
        )
    }

    func performSearchAction(
        _ action: Page.Action,
        in state: inout State
    ) -> EffectTask<Action> {
        switch action {
        case .barrierLoadData(let input):
            return .run { [state] send in
                do {
                    let result = try await searchUsersUseCase(.init(
                        query: state.query,
                        limit: input.limit,
                        offset: 1
                    ))
                    await send(.searchAction(.reset(.success(
                        result.map(User.init))
                    )))
                } catch {
                    await send(.searchAction(.reset(.failure(error))))
                    await send(.error(error))
                }
            }.cancellable(id: CancelID.search)
        case .barrierNextPage(let input):
            return .run { [state] send in
                do {
                    let result = try await searchUsersUseCase(.init(
                        query: state.query,
                        limit: input.limit,
                        offset: (state.searchPage.items.count / input.limit) + 1
                    ))
                    await send(.searchAction(.append(.success(
                        result.map(User.init))
                    )))
                } catch {
                    await send(.searchAction(.reset(.failure(error))))
                    await send(.error(error))
                }
            }.cancellable(id: CancelID.search)
        default:
            return .none
        }
    }
}
