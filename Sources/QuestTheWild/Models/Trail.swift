import Foundation

struct Trail: Identifiable, Codable {
    var id = UUID()
    var name: String
    var summary: String
    var distanceKm: Double
    var isDogFriendly: Bool

    static let sample: [Trail] = [
        Trail(name: "Local River Loop", summary: "Shaded flat route.", distanceKm: 3.2, isDogFriendly: true),
        Trail(name: "Pine Ridge Path", summary: "Mild climb through forest.", distanceKm: 5.8, isDogFriendly: true),
        Trail(name: "Sunset Meadow", summary: "Easy recovery route.", distanceKm: 2.1, isDogFriendly: false)
    ]
}
