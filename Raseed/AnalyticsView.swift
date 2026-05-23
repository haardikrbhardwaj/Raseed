import SwiftUI
import SwiftData
import Charts

struct AnalyticsView: View {

    @AppStorage("selectedCurrency")
    private var selectedCurrency = "₹"

    @StateObject
    private var languageManager = LanguageManager.shared

    @Query(
        sort: \Expense.createdAt,
        order: .reverse
    )
    private var expenses: [Expense]

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black
                    .ignoresSafeArea()

                ScrollView {

                    VStack(
                        alignment: .leading,
                        spacing: 24
                    ) {

                        // MARK: HEADER

                        VStack(
                            alignment: .leading,
                            spacing: 8
                        ) {

                            Text("analytics")
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)

                            Text("track_spending")
                                .foregroundColor(.gray)
                        }

                        // MARK: SUMMARY CARDS

                        HStack(spacing: 16) {

                            analyticsCard(
                                title: NSLocalizedString(
                                    "total_spent",
                                    comment: ""
                                ),
                                value: "\(selectedCurrency) \(Int(totalSpent))",
                                icon: "wallet.pass.fill",
                                color: .yellow
                            )

                            analyticsCard(
                                title: NSLocalizedString(
                                    "expenses",
                                    comment: ""
                                ),
                                value: "\(expenses.count)",
                                icon: "chart.bar.fill",
                                color: .orange
                            )
                        }

                        // MARK: CHART

                        VStack(
                            alignment: .leading,
                            spacing: 16
                        ) {

                            Text("category_spending")
                                .foregroundColor(.white)
                                .font(.headline)

                            Chart {

                                ForEach(
                                    categoryTotals,
                                    id: \.category
                                ) { item in

                                    let localizedName = NSLocalizedString(
                                        item.category.lowercased(),
                                        comment: ""
                                    )

                                    BarMark(
                                        x: .value(
                                            "category",
                                            localizedName
                                        ),
                                        y: .value(
                                            "amount",
                                            item.total
                                        )
                                    )
                                    .foregroundStyle(
                                        by: .value(
                                            "category",
                                            localizedName
                                        )
                                    )
                                    .cornerRadius(8)
                                }
                            }
                            .frame(height: 260)
                        }
                        .padding()
                        .background(AppColors.card)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 30)
                        )

                        // MARK: BREAKDOWN

                        VStack(
                            alignment: .leading,
                            spacing: 16
                        ) {

                            Text("breakdown")
                                .foregroundColor(.white)
                                .font(.headline)

                            ForEach(
                                categoryTotals,
                                id: \.category
                            ) { item in

                                HStack(spacing: 16) {

                                    ZStack {

                                        Circle()
                                            .fill(
                                                categoryColor(item.category)
                                                    .opacity(0.2)
                                            )
                                            .frame(
                                                width: 50,
                                                height: 50
                                            )

                                        Text(categoryIcon(item.category))
                                            .font(.title3)
                                    }

                                    VStack(
                                        alignment: .leading,
                                        spacing: 4
                                    ) {

                                        Text(
                                            LocalizedStringKey(
                                                item.category.lowercased()
                                            )
                                        )
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)

                                        Text(
                                            "\(percentage(for: item.total))% \(NSLocalizedString("of_spending", comment: ""))"
                                        )
                                        .foregroundColor(.gray)
                                        .font(.caption)
                                    }

                                    Spacer()

                                    Text(
                                        "\(selectedCurrency) \(Int(item.total))"
                                    )
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                }
                                .padding()
                                .background(AppColors.card)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 24)
                                )
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true)
            .id(languageManager.selectedLanguage)
        }
    }

    // MARK: TOTAL SPENT

    private var totalSpent: Double {
        expenses.reduce(0) { $0 + $1.amount }
    }

    // MARK: CATEGORY TOTALS

    private var categoryTotals: [CategoryTotal] {

        let grouped = Dictionary(
            grouping: expenses,
            by: { $0.category.lowercased().capitalized }
        )

        return grouped.map {
            CategoryTotal(
                category: $0.key,
                total: $0.value.reduce(0) { $0 + $1.amount }
            )
        }
        .sorted { $0.total > $1.total }
    }

    // MARK: ANALYTICS CARD

    private func analyticsCard(
        title: String,
        value: String,
        icon: String,
        color: Color
    ) -> some View {

        VStack(
            alignment: .leading,
            spacing: 14
        ) {

            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)

            Text(title)
                .foregroundColor(.gray)

            Text(value)
                .foregroundColor(.white)
                .font(.title2.bold())
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(color.opacity(0.15))
        .clipShape(
            RoundedRectangle(cornerRadius: 28)
        )
    }

    // MARK: PERCENTAGE

    private func percentage(for value: Double) -> Int {
        guard totalSpent > 0 else { return 0 }
        return Int((value / totalSpent) * 100)
    }

    // MARK: ICONS

    private func categoryIcon(_ category: String) -> String {
        switch category.lowercased() {
        case "food":          return "🍔"
        case "travel":        return "🚕"
        case "shopping":      return "🛍"
        case "bills":         return "📄"
        case "gym":           return "🏋️"
        case "fuel":          return "⛽️"
        case "medicine":      return "💊"
        case "books":         return "📚"
        case "entertainment": return "🎬"
        default:              return "✨"
        }
    }

    // MARK: COLORS

    private func categoryColor(_ category: String) -> Color {
        switch category.lowercased() {
        case "food":          return .orange
        case "travel":        return .blue
        case "shopping":      return .purple
        case "bills":         return .green
        case "gym":           return .yellow
        case "fuel":          return .orange
        case "medicine":      return .red
        case "books":         return .green
        case "entertainment": return .pink
        default:              return .gray
        }
    }
}

// MARK: MODEL

struct CategoryTotal {
    let category: String
    let total: Double
}
