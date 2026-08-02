import SwiftUI

struct QuestListView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            List {
                ForEach(Quest.QuestType.allCases, id: \.self) { type in
                    let filtered = appState.quests.filter { $0.type == type }
                    if !filtered.isEmpty {
                        Section(type.rawValue.capitalized) {
                            ForEach(filtered) { quest in
                                QuestRow(quest: quest) { appState.completeQuest(quest) }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Quests")
        }
    }
}

struct QuestRow: View {
    let quest: Quest
    let onComplete: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(quest.title).font(.ptHeadline).strikethrough(quest.isComplete)
                Text(quest.description).font(.ptCaption).foregroundStyle(Color.ptMuted)
                Text("+\(quest.xpReward) XP").font(.ptCaption).foregroundStyle(Color.ptPrimary)
            }
            Spacer()
            if quest.isComplete {
                Image(systemName: "checkmark.circle.fill").foregroundStyle(Color.ptPrimary)
            } else {
                Button("Done") { onComplete() }
                    .buttonStyle(.bordered)
                    .tint(Color.ptPrimary)
            }
        }
        .padding(.vertical, 4)
    }
}
