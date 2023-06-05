// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HomeApp",
    defaultLocalization: "pt_BR",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9)],
    products: [
        .library(
            name: "HomeApp",
            targets: ["HomeApp"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/brennobemoura/navigation-kit.git",
            from: "1.0.0-alpha.5"
        ),
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture.git",
            from: "0.54.0"
        ),
        .package(
            url: "https://github.com/hmlongco/Factory.git",
            from: "2.1.5"
        ),
        .package(
            url: "https://github.com/request-dl/request-dl.git",
            from: "2.2.3"
        ),
        .package(
            url: "https://github.com/auth0/SimpleKeychain.git",
            from: "1.0.1"
        ),
        .package(
            url: "https://github.com/github-brenno-compass/GithubUI.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/github-brenno-compass/GithubKit.git",
            branch: "main"
        )
    ],
    targets: [
        // MARK: - App

        .target(
            name: "HomeApp",
            dependencies: [
                .product(name: "NavigationKit", package: "navigation-kit"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "Factory",
                "GithubKit",
                "HomeDomain",
                "HomeAppData",
                "HomeNetworking",
                "HomeStorage",
                "HomeScenes",
                "HomeRepositoriesFeature",
                "HomeUsersFeature"
            ],
            resources: [.process("Resources")]
        ),

        // MARK: - Core

        .target(
            name: "HomeDomain",
            dependencies: [
                "Factory",
                "GithubKit"
            ],
            resources: [.process("Resources")]
        ),

        .target(
            name: "HomeAppData",
            dependencies: [
                "Factory",
                "GithubKit",
                "HomeDomain"
            ],
            resources: [.process("Resources")]
        ),

        .target(
            name: "HomeNetworking",
            dependencies: [
                "Factory",
                "GithubKit",
                "HomeDomain",
                "HomeAppData",
                .product(name: "RequestDL", package: "request-dl")
            ],
            resources: [.process("Resources")]
        ),

        .target(
            name: "HomeStorage",
            dependencies: [
                "Factory",
                "GithubKit",
                "HomeDomain",
                "HomeAppData",
                "SimpleKeychain"
            ],
            resources: [.process("Resources")]
        ),

        .target(
            name: "HomeScenes",
            dependencies: [
                "Factory",
                "GithubKit",
                "GithubUI",
                "HomeDomain"
            ],
            resources: [.process("Resources")]
        ),

        // MARK: - Features

        .target(
            name: "HomeRepositoriesFeature",
            dependencies: [
                "Factory",
                "GithubKit",
                "GithubUI",
                "HomeDomain",
                "HomeScenes"
            ],
            path: "Sources/Features/HomeRepositoriesFeature",
            resources: [.process("Resources")]
        ),

        .target(
            name: "HomeUsersFeature",
            dependencies: [
                "Factory",
                "GithubKit",
                "GithubUI",
                "HomeDomain",
                "HomeScenes"
            ],
            path: "Sources/Features/HomeUsersFeature",
            resources: [.process("Resources")]
        ),

        // MARK: - App Tests

        .testTarget(
            name: "HomeAppTests",
            dependencies: ["HomeApp"]
        ),

        // MARK: - Core Tests

        .testTarget(
            name: "HomeDomainTests",
            dependencies: ["HomeDomain"]
        ),

        .testTarget(
            name: "HomeAppDataTests",
            dependencies: ["HomeAppData"]
        ),

        .testTarget(
            name: "HomeStorageTests",
            dependencies: ["HomeStorage"]
        ),

        .testTarget(
            name: "HomeNetworkingTests",
            dependencies: ["HomeNetworking"]
        ),

        .testTarget(
            name: "HomeScenesTests",
            dependencies: ["HomeScenes"]
        ),

        // MARK: - Features Tests

        .testTarget(
            name: "HomeRepositoriesFeatureTests",
            dependencies: ["HomeRepositoriesFeature"],
            path: "Tests/Features/HomeRepositoriesFeatureTests"
        ),

        .testTarget(
            name: "HomeUsersFeatureTests",
            dependencies: ["HomeUsersFeature"],
            path: "Tests/Features/HomeUsersFeatureTests"
        )
    ]
)
