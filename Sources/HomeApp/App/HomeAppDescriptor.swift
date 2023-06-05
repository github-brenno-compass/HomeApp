//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import GithubKit
import NavigationKit
import HomeUsersFeature
import HomeRepositoriesFeature

public struct HomeAppDescriptor: MiniAppDescriptor {

    public init() {}

    public func body(content: Content) -> some View {
        content
            .modifier(UsersFeatureDescriptor())
            .modifier(RepositoriesFeatureDescriptor())
    }
}
