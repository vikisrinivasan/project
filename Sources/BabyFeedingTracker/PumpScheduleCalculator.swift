import Foundation

public struct PumpScheduleCalculator {
    public init() {}

    /// Calculates the optimal pumping interval in minutes.
    /// - Parameters:
    ///   - babyIntakePerFeedML: baby's milk intake per feed in milliliters.
    ///   - feedingFrequencyMinutes: minutes between feeds.
    ///   - milkYieldPer10MinML: milk produced in a 10 minute pumping session.
    /// - Returns: interval in minutes rounded down to the nearest 30. Minimum 30.
    public func recommendedInterval(
        babyIntakePerFeedML: Double,
        feedingFrequencyMinutes: Double,
        milkYieldPer10MinML: Double
    ) -> Int {
        guard babyIntakePerFeedML > 0,
              feedingFrequencyMinutes > 0,
              milkYieldPer10MinML > 0 else {
            return 30
        }
        let consumptionRate = babyIntakePerFeedML / feedingFrequencyMinutes // ml per minute
        let rawInterval = milkYieldPer10MinML / consumptionRate
        let rounded = max(30, Int(rawInterval) / 30 * 30)
        return rounded
    }
}
