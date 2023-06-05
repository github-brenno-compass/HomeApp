//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import ComposableArchitecture
import GithubUI

struct UserView: View {

    let viewStore: ViewStoreOf<UserReducer>

    var body: some View {
        let detail = viewStore.state.detail

        GithubScreen(title) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 8) {
                        AsyncImage(url: detail.avatarURL) {
                            $0.resizable()
                        } placeholder: {
                            Circle()
                                .fill(.secondary)
                        }
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())

                        HStack(spacing: .zero) {
                            Text(detail.name ?? detail.username)
                                .font(.body)
                                .foregroundColor(.primary)

                            Spacer()
                        }
                    }

                    section(
                        name: L10n.UserView.bio,
                        value: detail.bio
                    )

                    section(
                        name: L10n.UserView.location,
                        value: detail.location
                    )

                    section(
                        name: L10n.UserView.company,
                        value: detail.company
                    )

                    Link(L10n.UserView.fullProfileLink, destination: detail.url)
                }
                .padding([.top, .horizontal], 16)
            }

            GithubFooter {
                GithubButton(L10n.UserView.repositoriesButton) {
                    viewStore.send(.repository)
                }
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

extension UserView {

    @ToolbarContentBuilder
    var toolbarItems: some ToolbarContent {
        ToolbarItem(.leading) {
            GithubBarButton.back {
                viewStore.send(.back)
            }
        }

        ToolbarItem(.trailing) {
            if viewStore.isLoading {
                ProgressView()
            }
        }
    }
}

extension UserView {

    var title: String {
        L10n.UserView.title(viewStore.detail.username)
    }
}

extension UserView {

    @ViewBuilder
    func section(name: String, value: String?) -> some View {
        if let value, !value.isEmpty {
            HStack(spacing: .zero) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(name)
                        .font(.callout)
                        .foregroundColor(.secondary)

                    Text(value)
                        .font(.body)
                        .foregroundColor(.primary)
                }

                Spacer()
            }
        }
    }
}
