import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 14) {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text("Level \(appState.profile.level)").font(.ptHeadline)
                            Spacer()
                            Text("\(appState.profile.xp) XP").font(.ptCaption).foregroundStyle(Color.ptMuted)
                        }
                        ProgressView(value: Double(appState.profile.xp % 100), total: 100)
                            .tint(Color.ptPrimary)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.ptSurface))

                    HStack(spacing: 12) {
                        StatCard(title: "Streak", value: "\(appState.profile.streak)")
                        StatCard(title: "Dog hikes", value: "\(appState.profile.dogHikes)")
                        StatCard(title: "Quests done", value: "\(appState.quests.filter(\.isComplete).count)")
                    }

                    if let quest = appState.quests.first(where: { !$0.isComplete }) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Today").font(.ptCaption).foregroundStyle(Color.ptMuted)
                            Text(quest.title).font(.ptTitle)
                            Text(quest.description).foregroundStyle(Color.ptMuted)
                            Button("Complete +\(quest.xpReward) XP") { appState.completeQuest(quest) }
                                .buttonStyle(.borderedProminent)
                                .tint(Color.ptPrimary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color.ptSurface))
                    } else {
                        Text("All quests done today. ").font(.ptHeadline).padding()
                    }

                    if appState.dog.isActive {
                        Button("Log dog hike +25 XP") { appState.logDogHike() }
                            .buttonStyle(.bordered)
                            .tint(Color.ptPrimary)
                    }
                }
                .padding()
            }
            .navigationTitle(appState.profile.name.isEmpty ? "Quest The Wild" : "Hey, \(appState.profile.name)")
            .background(Color.ptBackground.ignoresSafeArea())
        }
    }
}
