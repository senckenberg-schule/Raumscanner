import SwiftUI

/// Platzhalter – Badges folgen laut Backlog in Release 1.2 (US-70).
struct BadgesView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "Badges folgen bald",
                systemImage: "medal",
                description: Text("Hier sammelst du später Badges wie „Erste Kreide“ oder „Sofa-Diplom“.")
            )
            .navigationTitle("Badges")
        }
    }
}
