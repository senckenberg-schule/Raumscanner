import SwiftUI

/// Kurzes Onboarding (US-27): Schule und Arbeitszeit, dann los.
struct OnboardingView: View {
    @AppStorage(SettingsKey.onboarded) private var onboarded = false

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Schön, dass du da bist.")
                            .font(.largeTitle.bold())
                        Text("Drei kurze Angaben, dann geht's los. Alles lässt sich später ändern.")
                            .foregroundStyle(.secondary)
                    }
                    .listRowBackground(Color.clear)
                }

                SchoolSettingsSection()

                Section {
                    Label("Deine Daten bleiben auf deinem iPhone. Kein Konto, kein Tracking.", systemImage: "lock.fill")
                        .font(.subheadline)
                }
            }
            .safeAreaInset(edge: .bottom) {
                Button {
                    onboarded = true
                } label: {
                    Text("Los geht's")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                }
                .buttonStyle(.glassProminent)
                .padding()
            }
        }
        .interactiveDismissDisabled()
    }
}
