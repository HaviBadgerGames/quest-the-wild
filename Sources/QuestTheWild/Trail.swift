import Foundation

struct Trail: Identifiable {
    let id = UUID()
    var name: String
    var summary: String

    static let sample = [
        Trail(name: "Local River Loop", summary: "3.2 km • shade • dog-friendly"),
        Trail(name: "Pine Ridge Path", summary: "5.8 km • mild climb • dog-friendly"),
        Trail(name: "Sunset Meadow", summary: "2.1 km • easy recovery route")
    ]
}
