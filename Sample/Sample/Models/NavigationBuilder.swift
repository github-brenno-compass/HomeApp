//
//  NavigationBuilder.swift
//  Sample
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import NavigationKit
import GithubKit
import GithubUI
import HomeApp

struct NavigationBuilder: GithubKit.NavigationBuilder {

    func callAsFunction<Content>(content: @escaping () -> Content) -> AnyView where Content: View {
        NKNavigationStack {
            content()
                .modifier(HomeAppActions())
                .modifier(HomeAppDescriptor())
        }
        .eraseToAnyView()
    }
}
