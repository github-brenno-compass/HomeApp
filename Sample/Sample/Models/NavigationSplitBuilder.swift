//
//  File.swift
//  Sample
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import NavigationKit
import GithubKit
import GithubUI

struct NavigationSplitBuilder: GithubKit.NavigationSplitBuilder {

    func callAsFunction<Sidebar, Content>(
        sidebar: @escaping () -> Sidebar,
        content: @escaping () -> Content
    ) -> AnyView where Sidebar: View, Content: View {
        NKNavigationSplitView(
            sidebar: sidebar,
            detail: content
        )
        .eraseToAnyView()
    }
}
