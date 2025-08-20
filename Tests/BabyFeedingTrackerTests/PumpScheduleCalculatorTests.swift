import XCTest
@testable import BabyFeedingTracker

final class PumpScheduleCalculatorTests: XCTestCase {
    func testRecommendedIntervalRoundsDownTo30() {
        let calc = PumpScheduleCalculator()
        // Suppose baby drinks 90ml every 180 minutes => 0.5 ml/min
        // Mom yields 120ml per 10 min => raw interval = 240 min -> rounded to 240
        let interval = calc.recommendedInterval(
            babyIntakePerFeedML: 90,
            feedingFrequencyMinutes: 180,
            milkYieldPer10MinML: 120
        )
        XCTAssertEqual(interval, 240)
    }

    func testMinimumIntervalIs30() {
        let calc = PumpScheduleCalculator()
        let interval = calc.recommendedInterval(
            babyIntakePerFeedML: 0,
            feedingFrequencyMinutes: 0,
            milkYieldPer10MinML: 0
        )
        XCTAssertEqual(interval, 30)
    }
}
