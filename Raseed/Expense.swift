//
//  Expense.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//


import Foundation
import SwiftData

@Model
final class Expense {

    var id: UUID
    var amount: Double
    var merchant: String
    var category: String
    var paymentMethod: String
    var notes: String
    var createdAt: Date

    init(
        amount: Double,
        merchant: String,
        category: String,
        paymentMethod: String = "UPI",
        notes: String = ""
    ) {

        self.id = UUID()
        self.amount = amount
        self.merchant = merchant
        self.category = category
        self.paymentMethod = paymentMethod
        self.notes = notes
        self.createdAt = .now
    }
}