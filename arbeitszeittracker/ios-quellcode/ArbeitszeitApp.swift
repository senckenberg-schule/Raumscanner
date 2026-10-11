import SwiftUI
import SwiftData

@main
struct ArbeitszeitApp: App {
    @State private var timer = TimerStore()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(timer)
                .tint(.brand)
        }
        .modelContainer(for: Entry.self)
    }
}
