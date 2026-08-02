import SwiftUI

@MainActor
final class AppState: ObservableObject {
    @Published var onboardingComplete: Bool {
        didSet { UserDefaults.standard.set(onboardingComplete, forKey: "onboardingComplete") }
    }
    @Published var profile = UserProfile()
    @Published var quests: [Quest] = Quest.sample
    @Published var dog = DogProfile()
    @Published var trails: [Trail] = Trail.sample
    @Published var selectedTab: Tab = .home

    enum Tab: Hashable { case home, quests, dog, trails, settings }

    init() {
        self.onboardingComplete = UserDefaults.standard.bool(forKey: "onboardingComplete")
    }

    func completeQuest(_ quest: Quest) {
        guard let i = quests.firstIndex(where: { $0.id == quest.id }), !quests[i].isComplete else { return }
        quests[i].isComplete = true
        profile.xp += quest.xpReward
        profile.streak += 1
    }

    func logDogHike() {
        dog.hikes += 1
        profile.dogHikes += 1
        profile.xp += 25
    }

    func reset() {
        onboardingComplete = false
        profile = UserProfile()
        quests = Quest.sample
        dog = DogProfile()
    }
}
