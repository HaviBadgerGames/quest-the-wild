import Foundation

struct DogProfile: Identifiable, Codable {
    var id = UUID()
    var name: String = ""
    var breed: String = ""
    var hikes: Int = 0
    var isActive: Bool = false
}
