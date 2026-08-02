import SwiftUI

struct QuestCard: View {
    let quest: Quest

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(quest.title).font(.headline)
            Text(quest.details).font(.subheadline).foregroundStyle(.secondary)
        }
        .padding()
    }
}
