//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import ComposableArchitecture
import GithubUI

struct UsersView: View {

    let viewStore: ViewStoreOf<UsersReducer>

    var body: some View {
        GithubScreen(L10n.UsersView.title) {
            switch displayMode {
            case .empty:
                GithubEmptyView(
                    title: L10n.UsersView.EmptyView.title,
                    description: L10n.UsersView.EmptyView.description
                )
            case .items(let page):
                PageListView(
                    items: page.items,
                    isLoading: page.isLoading,
                    content: { item in
                        Button {
                            viewStore.send(.user(item))
                        } label: {
                            GithubUserItem(item.username) {
                                AsyncImage(url: item.avatarURL) {
                                    $0.resizable()
                                } placeholder: {
                                    Circle()
                                        .fill(.secondary)
                                }
                            }
                        }
                    },
                    onAppear: {
                        if viewStore.query.isEmpty {
                            viewStore.send(.pageAction(.itemDidAppear($0)))
                        } else {
                            viewStore.send(.searchAction(.itemDidAppear($0)))
                        }
                    }
                )
            }
        }
        .viewState(viewStore.binding(
            get: \.viewState,
            send: { .viewState($0) }
        ))
        .toolbar {
            toolbarItems
        }
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .searchable(
            text: viewStore.binding(
                get: \.query,
                send: { .queryDidChange($0) }
            )
        )
    }
}

extension UsersView {

    @ToolbarContentBuilder
    var toolbarItems: some ToolbarContent {
        ToolbarItem(.trailing) {
            Button(L10n.UsersView.logout) {
                viewStore.send(.logout)
            }
        }
    }
}

extension UsersView {

    enum DisplayMode {
        case items(UsersReducer.Page.State)
        case empty
    }

    var displayMode: DisplayMode {
        if viewStore.page.items.isEmpty && !viewStore.page.isLoading {
            return .empty
        }

        return .items(viewStore.query.isEmpty ? viewStore.page : viewStore.searchPage)
    }
}
