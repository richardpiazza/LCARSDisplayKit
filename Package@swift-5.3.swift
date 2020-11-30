// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LCARSDisplayKit",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .watchOS(.v7),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "LCARSDisplayKit",
            targets: ["LCARSDisplayKit"]),
        ],
    dependencies: [
        .package(url: "https://github.com/richardpiazza/GraphPoint.git", .upToNextMinor(from: "4.0.0")),
        ],
    targets: [
        .target(
            name: "LCARSDisplayKit",
            dependencies: ["GraphPoint"],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "LCARSDisplayKitTests",
            dependencies: ["GraphPoint", "LCARSDisplayKit"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
