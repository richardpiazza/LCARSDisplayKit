// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LCARSDisplayKit",
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
        .package(url: "https://github.com/richardpiazza/GraphPoint.git", .upToNextMajor(from: "3.3.0")),
        ],
    targets: [
        .target(
            name: "LCARSDisplayKit",
            dependencies: ["GraphPoint"],
            path: "Sources/LCARSDisplayKit"),
        .target(
            name: "LCARSDisplayKitUI",
            dependencies: ["GraphPoint", "LCARSDisplayKit"],
            path: "Sources/LCARSDisplayKitUI"),
        .target(
            name: "LCARSDisplayKitViews",
            dependencies: ["GraphPoint", "LCARSDisplayKit", "LCARSDisplayKitUI"],
            path: "Sources/LCARSDisplayKitViews"),
        .testTarget(
            name: "LCARSDisplayKitTests",
            dependencies: ["GraphPoint", "LCARSDisplayKit"],
            path: "Tests/LCARSDisplayKitTests")
    ],
    swiftLanguageVersions: [.v4_2, .v5]
)
