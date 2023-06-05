//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import ComposableArchitecture
import GithubUI

struct RepositoriesView: View {

    let viewStore: ViewStoreOf<RepositoriesReducer>

    var body: some View {
        GithubScreen(L10n.RepositoriesView.title) {
            switch displayMode {
            case .empty:
                GithubEmptyView(
                    title: L10n.RepositoriesView.EmptyView.title,
                    description: L10n.RepositoriesView.EmptyView.description
                )
            case .items:
                PageListView(
                    items: viewStore.page.items,
                    isLoading: viewStore.page.isLoading,
                    content: { item in
                        GithubRepositoryItem(
                            url: item.url,
                            title: item.name,
                            description: item.description,
                            isPublic: item.isPublic,
                            tags: {
                                if let language = item.language {
                                    GithubTagView(language) {
                                        Circle()
                                            .fill(.orange)
                                    }
                                }

                                GithubTagView(String(format: "%2d", item.stars)) {
                                    Image(systemName: "star")
                                        .resizable()
                                }
                            }
                        )
                    },
                    onAppear: {
                        viewStore.send(.pageAction(.itemDidAppear($0)))
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
    }
}

extension RepositoriesView {

    @ToolbarContentBuilder
    var toolbarItems: some ToolbarContent {
        ToolbarItem(.leading) {
            GithubBarButton.back {
                viewStore.send(.back)
            }
        }
    }
}

extension RepositoriesView {

    enum DisplayMode {
        case items
        case empty
    }

    var displayMode: DisplayMode {
        if viewStore.page.items.isEmpty && !viewStore.page.isLoading {
            return .empty
        }

        return .items
    }
}
