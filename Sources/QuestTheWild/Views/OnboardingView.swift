import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var appState: AppState
    @State private var step = 0
    @State private var mode = "hiking"
    @State private var name = ""
    @State private var dogName = ""
    @State private var dogBreed = ""
    @State private var hasDog = false

    private let steps = ["Welcome", "About You", "Dog Mode", "Ready"]

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 6) {
                ForEach(0..<steps.count, id: \.self) { i in
                    Capsule()
                        .fill(i <= step ? Color.ptPrimary : Color.ptLine)
                        .frame(height: 5)
                }
            }
            .padding()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text(steps[step]).font(.ptCaption).foregroundStyle(Color.ptMuted)
                    switch step {
                    case 0:
                        Text("Start your quest.").font(.ptLargeTitle)
                        Text("Build an outdoor habit with quests, streaks, and trail logs.").foregroundStyle(Color.ptMuted)
                        modeChoice
                    case 1:
                        Text("Who are you?").font(.ptLargeTitle)
                        TextField("Your name", text: $name)
                            .textFieldStyle(.roundedBorder)
                    case 2:
                        Text("Do you hike with a dog?").font(.ptLargeTitle)
                        Toggle("I hike with a dog", isOn: $hasDog).tint(Color.ptPrimary)
                        if hasDog {
                            TextField("Dog name", text: $dogName).textFieldStyle(.roundedBorder)
                            TextField("Dog breed", text: $dogBreed).textFieldStyle(.roundedBorder)
                        }
                    default:
                        Text("You're ready.").font(.ptLargeTitle)
                        Text("Home dashboard, quests, dog mode, and trails are all set.").foregroundStyle(Color.ptMuted)
                    }
                }
                .padding()
            }

            Spacer()

            HStack {
                if step > 0 {
                    Button("Back") { step -= 1 }.foregroundStyle(Color.ptMuted)
                }
                Spacer()
                Button(step == steps.count - 1 ? "Enter the wild" : "Next") {
                    if step < steps.count - 1 { step += 1 }
                    else {
                        appState.profile.name = name
                        appState.dog.name = dogName
                        appState.dog.breed = dogBreed
                        appState.dog.isActive = hasDog
                        appState.onboardingComplete = true
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.ptPrimary)
            }
            .padding()
        }
        .background(Color.ptBackground.ignoresSafeArea())
    }

    var modeChoice: some View {
        VStack(spacing: 10) {
            ForEach(["hiking", "dog", "both"], id: \.self) { m in
                Button {
                    mode = m
                    if m != "hiking" { hasDog = true }
                } label: {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(modeTitle(m)).font(.ptHeadline)
                            Text(modeDesc(m)).font(.ptCaption).foregroundStyle(Color.ptMuted)
                        }
                        Spacer()
                        if mode == m { Image(systemName: "checkmark").foregroundStyle(Color.ptPrimary) }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 14).fill(Color.ptSurface))
                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(mode == m ? Color.ptPrimary : Color.ptLine, lineWidth: 1.5))
                }
                .buttonStyle(.plain)
            }
        }
    }

    func modeTitle(_ m: String) -> String {
        switch m { case "hiking": return "Build a hiking habit"; case "dog": return "Dog-friendly hikes"; default: return "Both" }
    }

    func modeDesc(_ m: String) -> String {
        switch m { case "hiking": return "Quests, streaks, and trail progress."; case "dog": return "Track hikes with your dog."; default: return "Full adventure + dog mode." }
    }
}
