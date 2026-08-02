import Foundation

struct Quest: Identifiable {
    let id = UUID()
    var title: String
    var details: String

    static let sampleFirst = Quest(title: "Daily Walk", details: "Take a 10 minute outdoor walk.")
    static let sample = [
        sampleFirst,
        Quest(title: "Trail Explorer", details: "Try one new route this week."),
        Quest(title: "Pack Leader", details: "Log a dog-friendly hike.")
    ]
}
