import Foundation

/// Reine Zeitberechnungen, ohne UI – gut testbar (TE-03).
enum TimeMath {
    /// "5:37 h"
    static func hoursMinutes(_ seconds: TimeInterval) -> String {
        short(seconds) + " h"
    }

    /// "5:37"
    static func short(_ seconds: TimeInterval) -> String {
        let minutes = max(0, Int((seconds / 60).rounded()))
        return String(format: "%d:%02d", minutes / 60, minutes % 60)
    }

    /// "0:42:18" für den laufenden Timer.
    static func stopwatch(_ seconds: TimeInterval) -> String {
        let s = max(0, Int(seconds))
        return String(format: "%d:%02d:%02d", s / 3600, (s % 3600) / 60, s % 60)
    }

    /// Soll pro Schultag aus Wochenarbeitszeit und Beschäftigungsumfang (5-Tage-Woche).
    static func dailyTarget(weeklyHours: Double, percent: Int) -> TimeInterval {
        weeklyHours * 3600 * Double(percent) / 100 / 5
    }
}
