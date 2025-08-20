// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "BabyFeedingTracker",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "BabyFeedingTracker", targets: ["BabyFeedingTracker"]),
    ],
    targets: [
        .target(name: "BabyFeedingTracker"),
        .testTarget(name: "BabyFeedingTrackerTests", dependencies: ["BabyFeedingTracker"])
    ]
)
