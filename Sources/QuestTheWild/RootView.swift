import SwiftUI

struct RootView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        Group {
            if appState.onboardingComplete {
                MainTabView()
            } else {
                OnboardingView()
            }
        }
    }
}
