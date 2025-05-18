// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LCARSDisplayKit",
    platforms: [
        .macOS(.v13),
        .macCatalyst(.v16),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
    ],
    products: [
        .library(
            name: "LCARSDisplayKit",
            targets: ["LCARSDisplayKit"],
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/richardpiazza/GraphPoint.git", .upToNextMajor(from: "5.1.0")),
    ],
    targets: [
        .target(
            name: "LCARSDisplayKit",
            dependencies: ["GraphPoint"],
            resources: [
                .process("Resources"),
            ]
        ),
        .testTarget(
            name: "LCARSDisplayKitTests",
            dependencies: ["GraphPoint", "LCARSDisplayKit"],
        )
    ],
    swiftLanguageVersions: [.v5]
)
