import Foundation

struct Quest: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var xpReward: Int
    var isComplete: Bool = false
    var type: QuestType

    enum QuestType: String, Codable, CaseIterable {
        case daily, weekly, boss
    }

    static let sample: [Quest] = [
        Quest(title: "Morning Trail", description: "Take a 10-minute outdoor walk.", xpReward: 10, type: .daily),
        Quest(title: "Trail Explorer", description: "Try one new route this week.", xpReward: 30, type: .weekly),
        Quest(title: "Pack Leader", description: "Log 5 dog-friendly hikes.", xpReward: 100, type: .boss)
    ]
}
