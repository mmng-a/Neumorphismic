// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Neumorphismic",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "Neumorphismic",
            targets: ["Neumorphismic"]),
    ],
    targets: [
        .target(
            name: "Neumorphismic",
            dependencies: [],
            path: "Neumorphismic/Sources"),
        .testTarget(
            name: "NeumorphismicTests",
            dependencies: ["Neumorphismic"],
            path: "Neumorphismic/Tests")
    ]
)
