// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "flutter_core_image_filters",
    platforms: [
        .iOS("15.0"),
        .macOS("15.0"),
    ],
    products: [
        .library(name: "flutter-core-image-filters", targets: ["flutter_core_image_filters"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "flutter_core_image_filters",
            dependencies: [
                "flutter_core_image_filters_objc",
                .product(name: "FlutterFramework", package: "FlutterFramework"),
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        ),
        .target(
            name: "flutter_core_image_filters_objc",
            cSettings: [
                .headerSearchPath("include/flutter_core_image_filters_objc")
            ]
        ),
    ]
)
