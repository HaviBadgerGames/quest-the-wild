import Foundation

struct UserProfile: Identifiable {
    let id = UUID()
    var name: String = ""
    var xp: Int = 0
    var streak: Int = 0
    var dogHikes: Int = 0
}
