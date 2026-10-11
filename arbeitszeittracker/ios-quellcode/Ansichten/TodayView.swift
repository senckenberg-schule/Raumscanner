import SwiftUI
import SwiftData

struct TodayView: View {
    @Environment(\.modelContext) private var context
    @Environment(TimerStore.self) private var timer
    @Query(sort: \Entry.start) private var allEntries: [Entry]
    @AppStorage(SettingsKey.wochenstunden) private var weeklyHours = 40.0
    @AppStorage(SettingsKey.umfang) private var percent = 100
    @State private var showForm = false

    private var todayEntries: [Entry] {
        allEntries.filter { Calendar.current.isDateInToday($0.start) }
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    DayRingCard(
                        entries: todayEntries,
                        target: TimeMath.dailyTarget(weeklyHours: weeklyHours, percent: percent),
                        runningCategory: timer.category,
                        runningStart: timer.startedAt
                    )
                }

                Section("Schnellstart") {
                    QuickStartGrid()
                }

                Section {
                    if todayEntries.isEmpty {
                        Text("Noch nichts erfasst. Tippe oben auf eine Tätigkeit.")
                            .foregroundStyle(.secondary)
                    }
                    ForEach(todayEntries) { entry in
                        EntryRow(entry: entry)
                    }
                    .onDelete { offsets in
                        let items = todayEntries
                        for index in offsets {
                            context.delete(items[index])
                        }
                    }
                } header: {
                    HStack {
                        Text("Einträge")
                        Spacer()
                        Button("Hinzufügen", systemImage: "plus") {
                            showForm = true
                        }
                        .font(.subheadline.weight(.semibold))
                        .textCase(nil)
                    }
                }
            }
            .navigationTitle("Heute")
            .sheet(isPresented: $showForm) {
                EntryFormView()
            }
            .safeAreaInset(edge: .bottom) {
                if timer.isRunning {
                    RunningTimerBar()
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                }
            }
        }
    }
}

// MARK: - Tagesring

private struct CategoryTotal: Identifiable {
    let category: Category
    let seconds: TimeInterval
    var id: Category { category }
}

struct DayRingCard: View {
    let entries: [Entry]
    let target: TimeInterval
    let runningCategory: Category?
    let runningStart: Date?

    var body: some View {
        TimelineView(.periodic(from: .now, by: 30)) { timeline in
            let parts = totals(at: timeline.date)
            let sum = parts.reduce(0) { $0 + $1.seconds }
            let denominator = max(target, sum, 1)

            HStack(spacing: 20) {
                ZStack {
                    Circle()
                        .stroke(Color.secondary.opacity(0.15), lineWidth: 14)
                    ForEach(Array(segments(parts, denominator: denominator).enumerated()), id: \.offset) { _, segment in
                        Circle()
                            .trim(from: segment.from, to: segment.to)
                            .stroke(segment.color, style: StrokeStyle(lineWidth: 14))
                            .rotationEffect(.degrees(-90))
                    }
                    VStack(spacing: 0) {
                        Text(TimeMath.short(sum))
                            .font(.system(.title, design: .rounded, weight: .bold))
                            .monospacedDigit()
                        Text("Stunden")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(width: 120, height: 120)
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Heute \(TimeMath.hoursMinutes(sum)) erfasst")

                VStack(alignment: .leading, spacing: 8) {
                    ForEach(Array(parts.sorted { $0.seconds > $1.seconds }.prefix(3))) { total in
                        HStack(spacing: 8) {
                            Circle().fill(total.category.color).frame(width: 10, height: 10)
                            Text(total.category.name).lineLimit(1)
                            Spacer()
                            Text(TimeMath.short(total.seconds))
                                .monospacedDigit()
                                .foregroundStyle(.secondary)
                        }
                        .font(.subheadline)
                    }
                    Divider()
                    Text(sum > target
                         ? "\(TimeMath.hoursMinutes(sum - target)) über dem Tagessoll"
                         : "Tagessoll \(TimeMath.hoursMinutes(target))")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.vertical, 6)
        }
    }

    private func totals(at now: Date) -> [CategoryTotal] {
        var seconds: [Category: TimeInterval] = [:]
        for entry in entries {
            seconds[entry.category, default: 0] += entry.duration
        }
        if let runningCategory, let runningStart {
            seconds[runningCategory, default: 0] += now.timeIntervalSince(runningStart)
        }
        return Category.allCases.compactMap { category in
            guard let value = seconds[category], value > 0 else { return nil }
            return CategoryTotal(category: category, seconds: value)
        }
    }

    private func segments(_ totals: [CategoryTotal], denominator: TimeInterval) -> [(from: CGFloat, to: CGFloat, color: Color)] {
        var result: [(from: CGFloat, to: CGFloat, color: Color)] = []
        var position: CGFloat = 0
        for total in totals {
            let length = CGFloat(total.seconds / denominator)
            result.append((from: position, to: min(1, position + length - 0.005), color: total.category.color))
            position += length
        }
        return result
    }
}

// MARK: - Schnellstart

struct QuickStartGrid: View {
    @Environment(\.modelContext) private var context
    @Environment(TimerStore.self) private var timer

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 4), count: 4)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 14) {
            ForEach(Category.allCases) { category in
                let isActive = timer.category == category
                Button {
                    timer.start(category, in: context)
                } label: {
                    VStack(spacing: 6) {
                        Image(systemName: category.symbol)
                            .font(.title3)
                            .foregroundStyle(.white)
                            .frame(width: 52, height: 52)
                            .background(category.color, in: .rect(cornerRadius: 14))
                            .overlay {
                                RoundedRectangle(cornerRadius: 17)
                                    .stroke(category.color, lineWidth: isActive ? 2.5 : 0)
                                    .padding(-4)
                            }
                        Text(category.name)
                            .font(.caption)
                            .fontWeight(isActive ? .bold : .regular)
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                    }
                }
                .buttonStyle(.plain)
                .accessibilityLabel("\(category.name) starten")
                .accessibilityAddTraits(isActive ? .isSelected : [])
            }
        }
        .padding(.vertical, 6)
    }
}

// MARK: - Laufender Timer

struct RunningTimerBar: View {
    @Environment(\.modelContext) private var context
    @Environment(TimerStore.self) private var timer

    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 0) {
                Text("\(timer.category?.name ?? "") · seit \(timer.startedAt?.formatted(date: .omitted, time: .shortened) ?? "")")
                    .font(.footnote)
                    .foregroundStyle(.white.opacity(0.85))
                TimelineView(.periodic(from: .now, by: 1)) { timeline in
                    Text(TimeMath.stopwatch(timeline.date.timeIntervalSince(timer.startedAt ?? timeline.date)))
                        .font(.system(.title2, design: .rounded, weight: .bold))
                        .monospacedDigit()
                        .foregroundStyle(.white)
                }
            }
            Spacer()
            Button {
                timer.stop(in: context)
            } label: {
                Image(systemName: "stop.fill")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .frame(width: 48, height: 48)
                    .background(Color.coral, in: .circle)
            }
            .accessibilityLabel("Timer stoppen")
        }
        .padding(.leading, 18)
        .padding(.trailing, 8)
        .padding(.vertical, 8)
        .glassEffect(.regular.tint(.brand), in: .capsule)
    }
}

// MARK: - Eintragszeile

struct EntryRow: View {
    let entry: Entry

    var body: some View {
        HStack(spacing: 12) {
            Circle().fill(entry.category.color).frame(width: 10, height: 10)
            VStack(alignment: .leading, spacing: 2) {
                Text(entry.category.name)
                    .strikethrough(entry.cancelled)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            Spacer()
            Text(entry.cancelled ? "fiel aus" : TimeMath.hoursMinutes(entry.duration))
                .monospacedDigit()
                .foregroundStyle(.secondary)
        }
    }

    private var subtitle: String {
        let range = "\(entry.start.formatted(date: .omitted, time: .shortened))–\(entry.end.formatted(date: .omitted, time: .shortened))"
        return entry.note.isEmpty ? range : "\(range) · \(entry.note)"
    }
}
