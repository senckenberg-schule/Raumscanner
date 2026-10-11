import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) private var context
    @AppStorage(SettingsKey.onboarded) private var onboarded = false
    @State private var confirmDelete = false

    var body: some View {
        NavigationStack {
            Form {
                SchoolSettingsSection()

                Section {
                    Button("Alle Daten löschen", role: .destructive) {
                        confirmDelete = true
                    }
                } header: {
                    Text("Daten")
                } footer: {
                    Text("Alles liegt nur auf diesem iPhone. Export und Backup folgen.")
                }
            }
            .navigationTitle("Einstellungen")
            .confirmationDialog("Wirklich alle Einträge löschen?", isPresented: $confirmDelete, titleVisibility: .visible) {
                Button("Alles löschen", role: .destructive) {
                    try? context.delete(model: Entry.self)
                    onboarded = false
                }
            } message: {
                Text("Das lässt sich nicht rückgängig machen.")
            }
        }
    }
}

/// Bundesland, Schulform und Soll – wird auch im Onboarding verwendet.
struct SchoolSettingsSection: View {
    @AppStorage(SettingsKey.bundesland) private var bundesland = "Hessen"
    @AppStorage(SettingsKey.schulform) private var schulform = "Gymnasium"
    @AppStorage(SettingsKey.umfang) private var percent = 100
    @AppStorage(SettingsKey.wochenstunden) private var weeklyHours = 40.0

    var body: some View {
        Section {
            Picker("Bundesland", selection: $bundesland) {
                ForEach(SchoolData.bundeslaender, id: \.self) { Text($0) }
            }
            Picker("Schulform", selection: $schulform) {
                ForEach(SchoolData.schulformen, id: \.self) { Text($0) }
            }
        } header: {
            Text("Deine Schule")
        }

        Section {
            Stepper(value: $percent, in: 10...100, step: 5) {
                LabeledContent("Beschäftigungsumfang", value: "\(percent) %")
            }
            Stepper(value: $weeklyHours, in: 20...48, step: 0.5) {
                LabeledContent("Wochenarbeitszeit", value: weeklyHours.formatted(.number.precision(.fractionLength(0...1))) + " h")
            }
        } header: {
            Text("Deine Arbeitszeit")
        } footer: {
            Text("Soll pro Schultag: \(TimeMath.hoursMinutes(TimeMath.dailyTarget(weeklyHours: weeklyHours, percent: percent))). Unverbindlicher Orientierungswert, keine Rechtsberatung.")
        }
    }
}
