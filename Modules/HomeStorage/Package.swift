// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HomeStorage",
    defaultLocalization: "pt_BR",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9)],
    products: [
        .library(
            name: "HomeStorage",
            targets: ["HomeStorage"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/hmlongco/Factory.git",
            from: "2.1.5"
        ),
        .package(
            url: "https://github.com/auth0/SimpleKeychain.git",
            from: "1.0.1"
        ),
        .package(
            url: "https://github.com/github-brenno-compass/GithubKit.git",
            branch: "main"
        ),
        .package(path: "../HomeDomain"),
        .package(path: "../HomeAppData")
    ],
    targets: [
        .target(
            name: "HomeStorage",
            dependencies: [
                "Factory",
                "SimpleKeychain",
                "GithubKit",
                "HomeDomain",
                "HomeAppData"
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "HomeStorageTests",
            dependencies: ["HomeStorage"]
        )
    ]
)
