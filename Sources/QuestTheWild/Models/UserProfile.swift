import Foundation

struct UserProfile: Identifiable, Codable {
    var id = UUID()
    var name: String = ""
    var xp: Int = 0
    var streak: Int = 0
    var dogHikes: Int = 0
    var level: Int { max(1, xp / 100) }
    var xpToNext: Int { (level * 100) - xp }
}
