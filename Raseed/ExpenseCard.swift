import SwiftUI

struct ExpenseCard: View {
    @AppStorage("selectedCurrency")
    private var selectedCurrency = "₹"
    let expense: Expense
    
    var body: some View {
        
        HStack(spacing: 16) {
            
            ZStack {
                
                Circle()
                    .fill(categoryColor.opacity(0.2))
                    .frame(width: 52, height: 52)
                
                Text(categoryIcon)
                    .font(.title3)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text(expense.merchant)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                
                Text(expense.category)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            
            Spacer()
            
            Text("\(selectedCurrency) \(Int(expense.amount))")
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .padding()
        .background(AppColors.card)
        .clipShape(
            RoundedRectangle(cornerRadius: 24)
        )
    }
    
    private var categoryIcon: String {
        
        switch expense.category.lowercased() {
            
        case "food":
            return "🍔"
            
        case "travel":
            return "🚕"
            
        case "shopping":
            return "🛍"
            
        case "bills":
            return "📄"
            
        case "entertainment":
            return "🎬"
            
        case "gym":
            return "🏋️"
            
        case "petrol":
            return "⛽️"
            
        case "medicine":
            return "💊"
            
        case "books":
            return "📚"
            
        default:
            return "❓"
        }
    }
    
    private var categoryColor: Color {
        
        switch expense.category.lowercased() {
            
        case "food":
            return .orange
            
        case "travel":
            return .blue
            
        case "shopping":
            return .purple
            
        case "bills":
            return .green
            
        case "gym":
            return .yellow
            
        case "fuel":
            return .orange
            
        case "medicine":
            return .red
            
        case "books":
            return .green
            
        case "entertainment":
            return .pink
            
        default:
            return .gray
        }
    }
}
