//
//  Category.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//


import SwiftUI

struct Category: Identifiable {

    let id = UUID()
    let name: String
    let icon: String
    let color: Color
}

extension Category {

    static let mock: [Category] = [
        .init(name: "Food", icon: "🍔", color: .orange),
        .init(name: "Travel", icon: "🚕", color: .blue),
        .init(name: "Shopping", icon: "🛍", color: .purple),
        .init(name: "Bills", icon: "📄", color: .green),
        .init(name: "Entertainment", icon: "🎬", color: .pink)
    ]
}