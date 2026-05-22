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
        .init(name:"Gym",icon:"🏋️",color:.yellow),
        .init(name:"Fuel", icon: "⛽️", color:.orange),
        .init(name: "Medicines", icon:"💊", color: .red),
        .init(name: "books", icon: "📚", color: .green),
        .init(name: "Entertainment", icon: "🎬", color: .pink),
        .init(name:"Other",icon:"❓",color:.red)
    ]
}
