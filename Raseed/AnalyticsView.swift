import SwiftUI
import Charts

struct AnalyticsView: View {

    let values: [Double] = [1200, 4200, 2200, 1800, 6000]

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black
                    .ignoresSafeArea()

                VStack(spacing: 24) {

                    Text("Analytics")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)

                    Chart {

                        ForEach(Array(values.enumerated()), id: \.offset) { index, value in

                            BarMark(
                                x: .value("Day", index),
                                y: .value("Amount", value)
                            )
                        }
                    }
                    .frame(height: 300)
                    .padding()
                    .background(Color.white.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 30))

                    Spacer()
                }
                .padding()
            }
        }
    }
}
