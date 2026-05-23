import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let color: Color
    
    // This turns your raw name string into a key SwiftUI can translate dynamically
    var localizedName: LocalizedStringKey {
        LocalizedStringKey(name.lowercased())
    }
}

extension Category {
    static let mock: [Category] = [
        .init(name: "food", icon: "🍔", color: .orange),
        .init(name: "travel", icon: "🚕", color: .blue),
        .init(name: "shopping", icon: "🛍", color: .purple),
        .init(name: "bills", icon: "📄", color: .green),
        .init(name: "gym", icon: "🏋️", color: .yellow),
        .init(name: "fuel", icon: "⛽️", color: .orange),
        .init(name: "medicine", icon: "💊", color: .red),
        .init(name: "books", icon: "📚", color: .blue),
        .init(name: "entertainment", icon: "🎬", color: .pink),
        .init(name: "other", icon: "❓", color: .red)
    ]
}
