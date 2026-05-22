//
//  BalanceCard.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//


import SwiftUI

struct BalanceCard: View {

    let totalSpent: Double
    let monthlyBudget: Double

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            Text("This Month")
                .foregroundColor(.gray)

            Text("₹\(Int(totalSpent))")
                .font(.system(size: 42, weight: .bold))
                .foregroundColor(.white)

            ProgressView(
                value: totalSpent,
                total: monthlyBudget
            )
            .tint(AppColors.gold)

            Text("Budget ₹\(Int(monthlyBudget))")
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}