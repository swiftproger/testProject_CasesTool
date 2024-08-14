// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "cases-tool",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Caser",
            targets: ["cases-tool"]
        ),
    ],
    targets: [
        .target(
            name: "cases-tool"
        ),
        .testTarget(
            name: "cases-toolTests",
            dependencies: ["cases-tool"]
        ),
    ]
)
