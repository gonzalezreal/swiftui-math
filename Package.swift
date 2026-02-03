// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "swiftui-math",
  platforms: [
    .iOS(.v15),
  ],
  products: [
    .library(name: "SwiftUIMath", targets: ["SwiftUIMath"])
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.18.7")
  ],
  targets: [
    .target(
      name: "SwiftUIMath",
      dependencies: [],
      resources: [.copy("mathFonts.bundle")]
    ),
    .testTarget(
      name: "SwiftUIMathTests",
      dependencies: [
        "SwiftUIMath",
        .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
      ],
      exclude: ["__Snapshots__"]
    ),
  ]
)
