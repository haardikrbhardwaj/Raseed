import Foundation
import Combine
import SwiftData

@MainActor
final class HomeViewModel: ObservableObject {

    @Published var expenses: [Expense] = []

    @Published var totalSpent: Double = 0

    @Published var aiInsight: String = ""

    func loadExpenses(context: ModelContext) {

        do {

            let descriptor = FetchDescriptor<Expense>(
                sortBy: [SortDescriptor(\.createdAt, order: .reverse)]
            )

            expenses = try context.fetch(descriptor)

            totalSpent = expenses.reduce(0) {
                $0 + $1.amount
            }

            aiInsight = AIService.shared.generateInsight(
                expenses: expenses
            )

        } catch {

            print(error)
        }
    }
}
