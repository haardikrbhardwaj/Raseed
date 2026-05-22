//
//  ExpenseCard.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//


import SwiftUI

struct ExpenseCard: View {

    let expense: Expense

    var body: some View {

        HStack(spacing: 16) {

            Circle()
                .fill(.white.opacity(0.1))
                .frame(width: 52, height: 52)
                .overlay {

                    Text(categoryEmoji)
                        .font(.title3)
                }

            VStack(alignment: .leading, spacing: 6) {

                Text(expense.merchant)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)

                Text(expense.category)
                    .foregroundColor(.gray)
            }

            Spacer()

            Text("₹\(Int(expense.amount))")
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .padding()
        .background(AppColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }

    var categoryEmoji: String {

        switch expense.category {
        case "Food":
            return "🍔"
        case "Travel":
            return "🚕"
        case "Shopping":
            return "🛍"
        default:
            return "💸"
        }
    }
}