import Foundation
import SwiftData

/// Woher ein Eintrag stammt (TE-02, Grundlage für E14).
enum EntrySource: String, Codable {
    case manual, timer, timetable, calendar
}

/// Ein erfasster Zeitabschnitt.
@Model
final class Entry {
    var categoryRaw: String
    var start: Date
    var end: Date
    var note: String
    var sourceRaw: String
    /// Vorläufig (z. B. aus Stundenplan) oder von der Lehrkraft bestätigt.
    var confirmed: Bool
    /// Stunde fiel aus (zählt dann nicht mit).
    var cancelled: Bool

    init(
        category: Category,
        start: Date,
        end: Date,
        note: String = "",
        source: EntrySource = .manual,
        confirmed: Bool = true
    ) {
        self.categoryRaw = category.rawValue
        self.start = start
        self.end = end
        self.note = note
        self.sourceRaw = source.rawValue
        self.confirmed = confirmed
        self.cancelled = false
    }

    var category: Category {
        get { Category(rawValue: categoryRaw) ?? .sonstiges }
        set { categoryRaw = newValue.rawValue }
    }

    var source: EntrySource {
        EntrySource(rawValue: sourceRaw) ?? .manual
    }

    /// Dauer in Sekunden; ausgefallene Einträge zählen nicht.
    var duration: TimeInterval {
        cancelled ? 0 : max(0, end.timeIntervalSince(start))
    }
}
