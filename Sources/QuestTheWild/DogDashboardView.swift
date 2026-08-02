import SwiftUI

struct DogDashboardView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text(appState.dogProfile.name.isEmpty ? "Add your dog" : appState.dogProfile.name)
                    .font(.title.bold())
                Text(appState.dogProfile.breed.isEmpty ? "Breed not set" : appState.dogProfile.breed)
                    .foregroundStyle(.secondary)
                Spacer()
            }
            .padding()
            .navigationTitle("Dog")
        }
    }
}
