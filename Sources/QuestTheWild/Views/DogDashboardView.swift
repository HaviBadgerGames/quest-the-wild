import SwiftUI

struct DogDashboardView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            Form {
                Section("Dog profile") {
                    TextField("Dog name", text: $appState.dog.name)
                    TextField("Dog breed", text: $appState.dog.breed)
                    Toggle("Dog mode active", isOn: $appState.dog.isActive).tint(Color.ptPrimary)
                }
                Section("Hike log") {
                    LabeledContent("Total hikes", value: "\(appState.dog.hikes)")
                    Button("Log hike +25 XP") { appState.logDogHike() }
                        .foregroundStyle(Color.ptPrimary)
                }
            }
            .navigationTitle(appState.dog.name.isEmpty ? "Dog" : appState.dog.name)
        }
    }
}
