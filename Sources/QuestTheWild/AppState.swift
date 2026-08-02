import SwiftUI

final class AppState: ObservableObject {
    @Published var theme: AppTheme = .pineTrail
    @Published var onboardingComplete = false
    @Published var selectedTab: AppTab = .home
    @Published var profile = UserProfile()
    @Published var quests: [Quest] = Quest.sample
    @Published var dogProfile = DogProfile()
    @Published var trails: [Trail] = Trail.sample
}

enum AppTheme {
    case pineTrail
    var colorScheme: ColorScheme? { nil }
}

enum AppTab: Hashable {
    case home, quests, dog, trails, settings
}
