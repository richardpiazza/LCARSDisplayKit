// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LCARSDisplayKit",
    platforms: [
        .macOS(.v15),
        .macCatalyst(.v18),
        .iOS(.v18),
        .tvOS(.v18),
        .watchOS(.v11),
        .visionOS(.v2),
    ],
    products: [
        .library(
            name: "LCARSDisplayKit",
            targets: ["LCARSDisplayKit"],
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/richardpiazza/GraphPoint.git", from: "5.1.0"),
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
    swiftLanguageModes: [.v5]
)
