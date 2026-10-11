import Foundation
import Observation
import SwiftData

/// Der laufende Timer. Gespeichert wird nur der Startzeitpunkt, kein Zähler,
/// damit er Neustarts und App-Beenden übersteht (US-10).
@Observable
final class TimerStore {
    private(set) var category: Category?
    private(set) var startedAt: Date?

    private let defaults = UserDefaults.standard
    private let categoryKey = "running.category"
    private let startKey = "running.start"

    init() {
        if let raw = defaults.string(forKey: categoryKey),
           let saved = Category(rawValue: raw),
           defaults.double(forKey: startKey) > 0 {
            category = saved
            startedAt = Date(timeIntervalSince1970: defaults.double(forKey: startKey))
        }
    }

    var isRunning: Bool { category != nil }

    /// Startet eine Tätigkeit. Läuft schon eine andere, wird diese vorher gespeichert.
    func start(_ newCategory: Category, in context: ModelContext) {
        guard newCategory != category else { return }
        stop(in: context)
        let now = Date.now
        category = newCategory
        startedAt = now
        defaults.set(newCategory.rawValue, forKey: categoryKey)
        defaults.set(now.timeIntervalSince1970, forKey: startKey)
    }

    /// Stoppt den Timer und legt einen Eintrag an.
    func stop(in context: ModelContext) {
        guard let running = category, let begin = startedAt else { return }
        context.insert(Entry(category: running, start: begin, end: .now, source: .timer))
        category = nil
        startedAt = nil
        defaults.removeObject(forKey: categoryKey)
        defaults.removeObject(forKey: startKey)
    }
}
