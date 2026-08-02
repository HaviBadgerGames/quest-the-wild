import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section("Theme") { Text("Pine Trail") }
                Section("Account") { Text("Supabase coming soon") }
            }
            .navigationTitle("Settings")
        }
    }
}
