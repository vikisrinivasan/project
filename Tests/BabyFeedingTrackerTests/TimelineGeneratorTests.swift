import XCTest
@testable import BabyFeedingTracker

final class TimelineGeneratorTests: XCTestCase {
    func testGeneratesExpectedNumberOfSessions() {
        let generator = TimelineGenerator()
        let calendar = Calendar(identifier: .gregorian)
        var components = DateComponents()
        components.year = 2023
        components.month = 1
        components.day = 1
        components.hour = 7
        components.minute = 0
        let start = calendar.date(from: components)!
        let times = generator.generateTimeline(start: start, intervalMinutes: 60)
        // From 07:00 to 23:59 with 60 min interval should produce 17 sessions (7:00..23:00 inclusive)
        XCTAssertEqual(times.count, 17)
        XCTAssertEqual(times.first, start)
    }
}
