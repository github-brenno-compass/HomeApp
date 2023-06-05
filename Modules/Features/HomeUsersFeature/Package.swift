// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HomeUsersFeature",
    defaultLocalization: "pt_BR",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9)],
    products: [
        .library(
            name: "HomeUsersFeature",
            targets: ["HomeUsersFeature"]
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
            url: "https://github.com/github-brenno-compass/GithubKit.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/github-brenno-compass/GithubUI.git",
            branch: "main"
        ),
        .package(path: "../../HomeDomain"),
        .package(path: "../../HomeScenes")
    ],
    targets: [
        .target(
            name: "HomeUsersFeature",
            dependencies: [
                .product(name: "NavigationKit", package: "navigation-kit"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "Factory",
                "GithubKit",
                "GithubUI",
                "HomeDomain",
                "HomeScenes"
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "HomeUsersFeatureTests",
            dependencies: ["HomeUsersFeature"]
        )
    ]
)
