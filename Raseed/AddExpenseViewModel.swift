import Foundation
import Combine
import SwiftData

@MainActor
final class AddExpenseViewModel: ObservableObject {

    @Published var amount = ""

    @Published var merchant = ""

    @Published var selectedCategory =
    Category.mock.first!

    func saveExpense(
        context: ModelContext
    ) async {

        guard let value = Double(amount) else {
            return
        }

        let expense = Expense(
            amount: value,
            merchant: merchant,
            category: selectedCategory.name
        )

        context.insert(expense)

        do {

            try context.save()

        } catch {

            print(error)
        }
    }
}
