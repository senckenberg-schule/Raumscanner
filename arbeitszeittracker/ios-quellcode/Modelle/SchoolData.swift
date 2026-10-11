import Foundation

/// Auswahllisten für Onboarding und Einstellungen (US-59).
/// Schulformen sind vorerst bundesweit gleich; länderspezifische Listen folgen aus Spike SP-01.
enum SchoolData {
    static let bundeslaender = [
        "Baden-Württemberg", "Bayern", "Berlin", "Brandenburg", "Bremen", "Hamburg",
        "Hessen", "Mecklenburg-Vorpommern", "Niedersachsen", "Nordrhein-Westfalen",
        "Rheinland-Pfalz", "Saarland", "Sachsen", "Sachsen-Anhalt", "Schleswig-Holstein", "Thüringen",
    ]

    static let schulformen = [
        "Grundschule", "Hauptschule", "Realschule", "Gesamtschule",
        "Gymnasium", "Förderschule", "Berufliche Schule",
    ]
}

/// Schlüssel für die Einstellungen in UserDefaults.
enum SettingsKey {
    static let onboarded = "onboarded"
    static let bundesland = "bundesland"
    static let schulform = "schulform"
    static let umfang = "umfang"
    static let wochenstunden = "wochenstunden"
}
