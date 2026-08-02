import SwiftUI

struct EmptyStateView: View {
    let title: String
    let message: String

    var body: some View {
        VStack(spacing: 8) {
            Text(title).font(.title3.bold())
            Text(message).foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}
