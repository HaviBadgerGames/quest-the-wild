import SwiftUI

struct TrailListView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            List(appState.trails) { trail in
                VStack(alignment: .leading) {
                    Text(trail.name).font(.headline)
                    Text(trail.summary).foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Trails")
        }
    }
}
