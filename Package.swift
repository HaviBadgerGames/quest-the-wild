// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "QuestTheWild",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .executable(name: "QuestTheWild", targets: ["QuestTheWild"])
    ],
    targets: [
        .executableTarget(
            name: "QuestTheWild",
            path: "Sources/QuestTheWild"
        )
    ]
)
