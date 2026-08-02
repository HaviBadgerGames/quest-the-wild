import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        TabView(selection: $appState.selectedTab) {
            HomeView().tabItem { Label("Home", systemImage: "house") }.tag(AppTab.home)
            QuestListView().tabItem { Label("Quests", systemImage: "checklist") }.tag(AppTab.quests)
            DogDashboardView().tabItem { Label("Dog", systemImage: "pawprint") }.tag(AppTab.dog)
            TrailListView().tabItem { Label("Trails", systemImage: "map") }.tag(AppTab.trails)
            SettingsView().tabItem { Label("Settings", systemImage: "gearshape") }.tag(AppTab.settings)
        }
    }
}
