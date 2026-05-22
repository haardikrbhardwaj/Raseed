//
//  AIService.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//


import Foundation

final class AIService {

    static let shared = AIService()

    func generateInsight(
        expenses: [Expense]
    ) -> String {

        let total = expenses.reduce(0) {
            $0 + $1.amount
        }

        return "You spent ₹\(Int(total)) this month."
    }
}