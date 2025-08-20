import Foundation

public struct TimelineGenerator {
    public init() {}

    /// Generates pumping session start times within the same day as `start`.
    /// - Parameters:
    ///   - start: starting Date for first pump session.
    ///   - intervalMinutes: interval between pump sessions.
    /// - Returns: Array of Dates representing session start times until end of day.
    public func generateTimeline(start: Date, intervalMinutes: Int) -> [Date] {
        guard intervalMinutes > 0 else { return [] }
        var times: [Date] = []
        let calendar = Calendar.current
        var current = start
        let endOfDay = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: start) ?? start
        while current <= endOfDay {
            times.append(current)
            guard let next = calendar.date(byAdding: .minute, value: intervalMinutes, to: current) else { break }
            current = next
        }
        return times
    }
}
