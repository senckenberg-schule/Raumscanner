import SwiftUI
import SwiftData
import Charts

/// Wochenübersicht mit Soll/Ist (US-07).
struct WeekView: View {
    @Query(sort: \Entry.start) private var allEntries: [Entry]
    @AppStorage(SettingsKey.wochenstunden) private var weeklyHours = 40.0
    @AppStorage(SettingsKey.umfang) private var percent = 100

    private struct DayTotal: Identifiable {
        let date: Date
        let seconds: TimeInterval
        var id: Date { date }
    }

    private var calendar: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "de_DE")
        calendar.firstWeekday = 2
        return calendar
    }

    private var days: [DayTotal] {
        guard let week = calendar.dateInterval(of: .weekOfYear, for: .now) else { return [] }
        return (0..<7).compactMap { offset in
            guard let day = calendar.date(byAdding: .day, value: offset, to: week.start) else { return nil }
            let seconds = allEntries
                .filter { calendar.isDate($0.start, inSameDayAs: day) }
                .reduce(0) { $0 + $1.duration }
            return DayTotal(date: day, seconds: seconds)
        }
    }

    private var dailyTarget: TimeInterval {
        TimeMath.dailyTarget(weeklyHours: weeklyHours, percent: percent)
    }

    var body: some View {
        let dayTotals = days
        let total = dayTotals.reduce(0) { $0 + $1.seconds }
        let elapsedSchoolDays = dayTotals.filter { $0.date <= .now && !calendar.isDateInWeekend($0.date) }.count
        let target = dailyTarget * Double(elapsedSchoolDays)
        let difference = total - target

        NavigationStack {
            List {
                Section {
                    HStack {
                        StatTile(title: "Ist", value: TimeMath.hoursMinutes(total))
                        StatTile(title: "Soll bis heute", value: TimeMath.hoursMinutes(target))
                        StatTile(
                            title: "Differenz",
                            value: (difference >= 0 ? "+" : "−") + TimeMath.hoursMinutes(abs(difference)),
                            highlight: difference > 0 ? Color.coral : Color.green
                        )
                    }
                }

                Section {
                    Chart {
                        ForEach(dayTotals) { day in
                            BarMark(
                                x: .value("Tag", day.date, unit: .day),
                                y: .value("Stunden", day.seconds / 3600)
                            )
                            .foregroundStyle(Color.brand)
                            .cornerRadius(6)
                        }
                        RuleMark(y: .value("Soll pro Tag", dailyTarget / 3600))
                            .lineStyle(StrokeStyle(lineWidth: 1.5, dash: [4, 4]))
                            .foregroundStyle(.secondary)
                    }
                    .chartXAxis {
                        AxisMarks(values: .stride(by: .day)) { _ in
                            AxisValueLabel(format: .dateTime.weekday(.abbreviated), centered: true)
                        }
                    }
                    .frame(height: 180)
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Woche")
        }
    }
}

private struct StatTile: View {
    let title: String
    let value: String
    var highlight: Color? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.system(.headline, design: .rounded))
                .monospacedDigit()
                .foregroundStyle(highlight ?? .primary)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
