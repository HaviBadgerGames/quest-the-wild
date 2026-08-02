import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    StatCard(title: "XP", value: "\(appState.profile.xp)")
                    StatCard(title: "Streak", value: "\(appState.profile.streak)")
                    StatCard(title: "Dog hikes", value: "\(appState.profile.dogHikes)")
                    QuestCard(quest: appState.quests.first ?? Quest.sampleFirst)
                }
                .padding()
            }
            .navigationTitle("Quest The Wild")
        }
    }
}
