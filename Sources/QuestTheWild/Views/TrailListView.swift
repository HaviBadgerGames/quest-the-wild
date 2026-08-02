import SwiftUI

struct TrailListView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            List(appState.trails) { trail in
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(trail.name).font(.ptHeadline)
                        Spacer()
                        if trail.isDogFriendly {
                            Image(systemName: "pawprint.fill").foregroundStyle(Color.ptPrimary)
                        }
                    }
                    Text(trail.summary).font(.ptCaption).foregroundStyle(Color.ptMuted)
                    Text(String(format: "%.1f km", trail.distanceKm)).font(.ptCaption).foregroundStyle(Color.ptPrimary)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Trails")
        }
    }
}
