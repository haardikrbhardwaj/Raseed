//
//  ExpenseRepository.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//


import Foundation
import SwiftData

@MainActor
final class ExpenseRepository {

    static let shared = ExpenseRepository()

    func saveExpense(
        context: ModelContext,
        expense: Expense
    ) async {

        context.insert(expense)

        try? context.save()

        do {

            try await NotionService.shared.createExpense(
                token: "USER_TOKEN",
                databaseID: "DATABASE_ID",
                expense: expense
            )

        } catch {

            print(error)
        }
    }
}