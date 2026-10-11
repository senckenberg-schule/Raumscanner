import SwiftUI

/// Tätigkeitsarten, angelehnt an gängige Arbeitszeitstudien (US-04).
enum Category: String, CaseIterable, Identifiable, Codable {
    case unterricht, vorbereitung, korrektur, konferenz, aufsicht, gespraeche, organisation, sonstiges

    var id: String { rawValue }

    var name: String {
        switch self {
        case .unterricht: "Unterricht"
        case .vorbereitung: "Vorbereitung"
        case .korrektur: "Korrektur"
        case .konferenz: "Konferenz"
        case .aufsicht: "Aufsicht"
        case .gespraeche: "Gespräche"
        case .organisation: "Organisation"
        case .sonstiges: "Sonstiges"
        }
    }

    var symbol: String {
        switch self {
        case .unterricht: "studentdesk"
        case .vorbereitung: "book.closed"
        case .korrektur: "pencil.line"
        case .konferenz: "person.3"
        case .aufsicht: "eye"
        case .gespraeche: "bubble.left.and.bubble.right"
        case .organisation: "folder"
        case .sonstiges: "ellipsis"
        }
    }

    var color: Color {
        switch self {
        case .unterricht: Color(hex: 0x0F766E)
        case .vorbereitung: Color(hex: 0x1D4ED8)
        case .korrektur: Color(hex: 0xC2410C)
        case .konferenz: Color(hex: 0x6D28D9)
        case .aufsicht: Color(hex: 0xA16207)
        case .gespraeche: Color(hex: 0x0E7490)
        case .organisation: Color(hex: 0x475569)
        case .sonstiges: Color(hex: 0xBE185D)
        }
    }
}

extension Color {
    /// Akzentfarbe der App (Petrol).
    static let brand = Color(hex: 0x0F4C5C)
    /// Farbe für Stopp und Mehrarbeit.
    static let coral = Color(hex: 0xE2471C)

    init(hex: UInt32) {
        self.init(
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255
        )
    }
}
