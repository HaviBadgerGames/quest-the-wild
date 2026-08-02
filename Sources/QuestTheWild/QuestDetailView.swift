import SwiftUI

struct QuestDetailView: View {
    let quest: Quest

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(quest.title).font(.title.bold())
            Text(quest.details).foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
    }
}
