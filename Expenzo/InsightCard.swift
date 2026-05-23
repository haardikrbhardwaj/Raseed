//
//  InsightCard.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//


import SwiftUI

struct InsightCard: View {

    let insight: String

    var body: some View {

        HStack(alignment: .top, spacing: 16) {

            Image(systemName: "sparkles")
                .font(.title2)
                .foregroundColor(.yellow)

            VStack(alignment: .leading, spacing: 8) {

                Text("AI Insight")
                    .foregroundColor(.white)
                    .font(.headline)

                Text(insight)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 28))
    }
}