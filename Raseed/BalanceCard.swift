//
//  BalanceCard.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//

import SwiftUI

struct BalanceCard: View {

    @AppStorage("selectedCurrency")
    private var selectedCurrency = "₹"

    let totalSpent: Double
    let monthlyBudget: Double

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 20
        ) {

            // MARK: HEADER

            HStack {

                VStack(
                    alignment: .leading,
                    spacing: 6
                ) {

                    Text("this_month")
                        .foregroundColor(.gray)

                    Text(
                        "\(selectedCurrency) \(Int(totalSpent))"
                    )
                    .font(
                        .system(
                            size: 42,
                            weight: .bold
                        )
                    )
                    .foregroundColor(.white)
                }

                Spacer()

                ZStack {

                    Circle()
                        .fill(
                            progressColor.opacity(0.18)
                        )
                        .frame(
                            width: 60,
                            height: 60
                        )

                    Image(
                        systemName: progressIcon
                    )
                    .font(.title2)
                    .foregroundColor(progressColor)
                }
            }

            // MARK: PROGRESS BAR

            VStack(
                alignment: .leading,
                spacing: 10
            ) {

                ProgressView(
                    value: progressValue
                )
                .tint(progressColor)

                HStack {

                    HStack(spacing: 4) {

                        Text("budget")
                        
                        Text("\(selectedCurrency) \(Int(monthlyBudget))")
                    }
                    .foregroundColor(.gray)
                    Spacer()

                    Text(
                        "\(Int(progressValue * 100))%"
                    )
                    .foregroundColor(progressColor)
                    .fontWeight(.semibold)
                }
                .font(.subheadline)
            }

            // MARK: STATUS MESSAGE

            Text(statusMessage)
                .foregroundColor(progressColor)
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .clipShape(
            RoundedRectangle(cornerRadius: 32)
        )
    }

    // MARK: PROGRESS VALUE

    private var progressValue: Double {

        guard monthlyBudget > 0 else {
            return 0
        }

        return min(
            totalSpent / monthlyBudget,
            1.0
        )
    }

    // MARK: PROGRESS COLOR

    private var progressColor: Color {

        if progressValue < 0.5 {

            return .green

        } else if progressValue < 0.8 {

            return .yellow

        } else {

            return .red
        }
    }

    // MARK: ICON

    private var progressIcon: String {

        if progressValue < 0.5 {

            return "checkmark.circle.fill"

        } else if progressValue < 0.8 {

            return "exclamationmark.triangle.fill"

        } else {

            return "flame.fill"
        }
    }

    // MARK: STATUS MESSAGE

    private var statusMessage: LocalizedStringKey {

        if progressValue < 0.5 {

            return "doing_great"

        } else if progressValue < 0.8 {

            return "approaching_budget"

        } else {

            return "budget_limit_reached"
        }
    }
}
