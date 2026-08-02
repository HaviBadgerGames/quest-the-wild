import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        TabView(selection: $appState.selectedTab) {
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }
                .tag(AppState.Tab.home)
            QuestListView()
                .tabItem { Label("Quests", systemImage: "checklist") }
                .tag(AppState.Tab.quests)
            DogDashboardView()
                .tabItem { Label("Dog", systemImage: "pawprint.fill") }
                .tag(AppState.Tab.dog)
            TrailListView()
                .tabItem { Label("Trails", systemImage: "map.fill") }
                .tag(AppState.Tab.trails)
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape.fill") }
                .tag(AppState.Tab.settings)
        }
        .tint(Color.ptPrimary)
    }
}
