// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LCARSDisplayKit",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "LCARSDisplayKit",
            targets: ["Shapes", "Components", "UI"]),
        ],
    dependencies: [
        .package(url: "https://github.com/richardpiazza/GraphPoint.git", .branch("feature/cartesian-naming")),
        ],
    targets: [
        .target(
            name: "Shapes",
            dependencies: ["GraphPoint"]
        ),
        .target(
            name: "Components",
            dependencies: ["GraphPoint", "Shapes"],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "UI",
            dependencies: ["GraphPoint", "Shapes", "Components"]
        ),
        .testTarget(
            name: "LCARSDisplayKitTests",
            dependencies: ["GraphPoint", "Shapes", "Components", "UI"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
