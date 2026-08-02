import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var appState: AppState
    @State private var step: Int = 0

    var body: some View {
        VStack(spacing: 20) {
            Text("Quest The Wild")
                .font(.largeTitle.bold())
            Text("Start your quest.")
                .foregroundStyle(.secondary)

            Group {
                switch step {
                case 0: Text("Choose your adventure style.")
                case 1: Text("Pick your goal.")
                case 2: Text("Add dog info if needed.")
                default: Text("You're ready.")
                }
            }
            .font(.title3.weight(.semibold))

            HStack {
                Button("Back") { step = max(0, step - 1) }
                Spacer()
                Button(step == 3 ? "Finish" : "Next") {
                    if step < 3 { step += 1 } else { appState.onboardingComplete = true }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.top, 12)
        }
        .padding()
    }
}
