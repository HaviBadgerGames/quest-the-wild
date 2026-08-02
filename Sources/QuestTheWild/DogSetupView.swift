import SwiftUI

struct DogSetupView: View {
    var body: some View {
        Form {
            TextField("Dog name", text: .constant(""))
            TextField("Dog breed", text: .constant(""))
        }
    }
}
