import SwiftUI

struct RootView: View {
    @AppStorage(SettingsKey.onboarded) private var onboarded = false

    var body: some View {
        TabView {
            Tab("Heute", systemImage: "clock") {
                TodayView()
            }
            Tab("Woche", systemImage: "chart.bar") {
                WeekView()
            }
            Tab("Badges", systemImage: "medal") {
                BadgesView()
            }
            Tab("Einstellungen", systemImage: "slider.horizontal.3") {
                SettingsView()
            }
        }
        .fullScreenCover(isPresented: Binding(
            get: { !onboarded },
            set: { onboarded = !$0 }
        )) {
            OnboardingView()
        }
    }
}
