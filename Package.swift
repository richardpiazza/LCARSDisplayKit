// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LCARSDisplayKit",
    products: [
        .library(name: "LCARSDisplayKit", targets: ["LCARSDisplayKit"]),
        ],
    dependencies: [
        .package(url: "https://github.com/richardpiazza/GraphPoint.git", .upToNextMajor(from: "3.1.1")),
        ],
    targets: [
        .target(name: "LCARSDisplayKit", dependencies: ["GraphPoint"], path: "Sources/LCARSDisplayKit"),
        .testTarget(name: "LCARSDisplayKitTests", dependencies: ["GraphPoint", "LCARSDisplayKit"], path: "Tests/LCARSDisplayKitTests")
    ]
)
