import SwiftUI

@main
struct QuestTheWildApp: App {
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
                .preferredColorScheme(appState.theme.colorScheme)
        }
    }
}
