import SwiftUI
import SwiftData

/// Manueller Eintrag (US-02).
struct EntryFormView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @State private var category: Category = .korrektur
    @State private var start = Calendar.current.date(byAdding: .hour, value: -1, to: .now) ?? .now
    @State private var end = Date.now
    @State private var note = ""

    private var isValid: Bool { end > start }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Tätigkeit", selection: $category) {
                        ForEach(Category.allCases) { category in
                            Label(category.name, systemImage: category.symbol).tag(category)
                        }
                    }
                    DatePicker("Beginn", selection: $start)
                    DatePicker("Ende", selection: $end)
                    LabeledContent("Dauer", value: isValid ? TimeMath.hoursMinutes(end.timeIntervalSince(start)) : "–")
                } footer: {
                    if !isValid {
                        Text("Das Ende muss nach dem Beginn liegen.")
                            .foregroundStyle(.red)
                    }
                }

                Section {
                    TextField("z. B. Klausur 10b korrigiert", text: $note, axis: .vertical)
                        .lineLimit(2...4)
                } header: {
                    Text("Notiz")
                } footer: {
                    Text("Bitte keine Namen von Schülerinnen und Schülern eintragen.")
                }
            }
            .navigationTitle("Neuer Eintrag")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Abbrechen") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Sichern") {
                        let trimmed = note.trimmingCharacters(in: .whitespacesAndNewlines)
                        context.insert(Entry(category: category, start: start, end: end, note: trimmed))
                        dismiss()
                    }
                    .disabled(!isValid)
                }
            }
        }
    }
}
