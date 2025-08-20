#if canImport(SwiftUI)
import SwiftUI

public struct ContentView: View {
    @AppStorage("babyIntake") private var babyIntake: Double = 60
    @AppStorage("feedFrequency") private var feedFrequency: Double = 180
    @AppStorage("milkYield") private var milkYield: Double = 100

    @State private var timeline: [Date] = []

    private let calculator = PumpScheduleCalculator()
    private let generator = TimelineGenerator()

    public init() {}

    public var body: some View {
        Form {
            Section(header: Text("Inputs")) {
                Stepper(value: $babyIntake, in: 0...500, step: 10) {
                    Text("Baby intake per feed: \(Int(babyIntake)) ml")
                }
                Stepper(value: $feedFrequency, in: 30...480, step: 30) {
                    Text("Feeding frequency: \(Int(feedFrequency)) min")
                }
                Stepper(value: $milkYield, in: 10...500, step: 10) {
                    Text("Milk yield per 10 min: \(Int(milkYield)) ml")
                }
            }
            Section(header: Text("Recommended")) {
                let interval = calculator.recommendedInterval(
                    babyIntakePerFeedML: babyIntake,
                    feedingFrequencyMinutes: feedFrequency,
                    milkYieldPer10MinML: milkYield
                )
                Text("Pump every \(interval) minutes")
                Button("Generate Timeline") {
                    timeline = generator.generateTimeline(start: Date(), intervalMinutes: interval)
                }
                ForEach(timeline, id: \.self) { date in
                    Text(date.formatted(date: .omitted, time: .shortened))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
