
 // swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "QuePersonaje",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .executable(
            name: "QuePersonaje",
            targets: ["QuePersonaje"]
        )
    ],
    targets: [
        .executableTarget(
            name: "QuePersonaje",
            path: "iOSApp"
        )
    ]
)
