import Foundation
import Combine
import SwiftData

@MainActor
final class AddExpenseViewModel: ObservableObject {

    @Published var amount = ""

    @Published var merchant = ""
    
    @Published var customCategory = ""

    @Published var selectedCategory =
    
    Category.mock.first!
    
    
    func saveExpense(
        context: ModelContext
    ) async {

        guard let value = Double(amount) else {
            return
        }

        let finalCategory =
        selectedCategory.name == "Other"
        ? customCategory
        : selectedCategory.name

        let expense = Expense(
            amount: value,
            merchant: merchant,
            category: finalCategory
        )

        context.insert(expense)

        do {

            try context.save()

            await MainActor.run {

                amount = ""

                merchant = ""

                customCategory = ""

                selectedCategory = Category.mock.first!
            }

        } catch {

            print(error)
        }
    }}
