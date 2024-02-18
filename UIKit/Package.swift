// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CHMUIKIT",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "CHMUIKIT", targets: ["CHMUIKIT"]),
    ],
    targets: [
        .target(
            name: "CHMUIKIT",
            path: "CHMUIKIT/CHMUIKIT",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
