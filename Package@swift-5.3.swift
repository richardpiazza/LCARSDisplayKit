// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LCARSDisplayKit",
    platforms: [
        .iOS(.v14), .tvOS(.v14)
    ],
    products: [
        .library(
            name: "LCARSDisplayKit",
            targets: ["LCARSDisplayKit"]),
        .library(
            name: "LCARSDisplayKitUI",
            targets: ["LCARSDisplayKitUI"]),
        .library(
            name: "LCARSDisplayKitViews",
            targets: ["LCARSDisplayKitViews"]),
        ],
    dependencies: [
        .package(url: "https://github.com/richardpiazza/GraphPoint.git", .branch("feature/cartesian-naming")),
        ],
    targets: [
        .target(
            name: "LCARSDisplayKit",
            dependencies: ["GraphPoint"],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "LCARSDisplayKitUI",
            dependencies: ["GraphPoint", "LCARSDisplayKit"]
        ),
        .target(
            name: "LCARSDisplayKitViews",
            dependencies: ["GraphPoint", "LCARSDisplayKit", "LCARSDisplayKitUI"]
        ),
        .testTarget(
            name: "LCARSDisplayKitTests",
            dependencies: ["GraphPoint", "LCARSDisplayKit"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
