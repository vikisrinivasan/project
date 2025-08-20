import Foundation

#if canImport(UserNotifications)
import UserNotifications
#endif

public struct NotificationManager {
    public init() {}

    #if canImport(UserNotifications)
    private let center = UNUserNotificationCenter.current()

    public func requestAuthorization() async throws -> Bool {
        try await center.requestAuthorization(options: [.alert, .sound])
    }

    public func scheduleNotifications(for dates: [Date]) async {
        let content = UNMutableNotificationContent()
        content.title = "Pump Reminder"
        content.body = "Time to pump"
        for date in dates {
            let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year,.month,.day,.hour,.minute], from: date), repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            try? await center.add(request)
        }
    }

    public func cancelAll() async {
        await center.removeAllPendingNotificationRequests()
    }
    #else
    // Stubs for non-Apple platforms
    public func requestAuthorization() async throws -> Bool { true }
    public func scheduleNotifications(for dates: [Date]) async {}
    public func cancelAll() async {}
    #endif
}
