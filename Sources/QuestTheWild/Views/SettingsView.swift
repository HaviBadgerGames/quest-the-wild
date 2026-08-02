import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            Form {
                Section("Theme") {
                    LabeledContent("Active theme", value: "Pine Trail")
                }
                Section("Backend") {
                    LabeledContent("Sync", value: "Supabase coming soon")
                }
                Section("Dev") {
                    Button("Reset app", role: .destructive) { appState.reset() }
                }
            }
            .navigationTitle("Settings")
        }
    }
}
