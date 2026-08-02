import SwiftUI

struct QuestListView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            List(appState.quests) { quest in
                QuestCard(quest: quest)
            }
            .navigationTitle("Quests")
        }
    }
}
