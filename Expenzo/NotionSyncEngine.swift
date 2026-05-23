import Foundation
import SwiftData

final class NotionSyncEngine {
    
    static let shared = NotionSyncEngine()
    
    @MainActor
    func saveAndSyncExpense(_ expense: Expense, context: ModelContext) {
        if UserDefaults.standard.string(forKey: "notion_access_token") != nil,
           UserDefaults.standard.string(forKey: "notion_database_id") != nil {
            print("Notion connected. Streaming directly to cloud dataset...")
            syncExpenseToNotion(expense: expense)
        } else {
            print("No Notion connection found. Saving data to local SwiftData storage...")
            context.insert(expense)
            do {
                try context.save()
            } catch {
                print("SwiftData write failure: \(error.localizedDescription)")
            }
        }
    }
    
    private func syncExpenseToNotion(expense: Expense) {
        let expenseAmount = expense.amount
        let expenseMerchant = expense.merchant
        let expenseCategory = expense.category
        let expenseDate = expense.createdAt

        guard let accessToken = UserDefaults.standard.string(forKey: "notion_access_token"),
              let databaseId = UserDefaults.standard.string(forKey: "notion_database_id") else {
            return
        }
        
        guard let url = URL(string: "https://raseed-backend.vercel.app/api/expense/add") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        let dateString = formatter.string(from: expenseDate)
        
        let body: [String: Any] = [
            "accessToken": accessToken,
            "databaseId": databaseId,
            "amount": expenseAmount,
            "merchant": expenseMerchant,
            "category": expenseCategory,
            "date": dateString
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else { return }
        request.httpBody = jsonData
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.waitsForConnectivity = true
        let session = URLSession(configuration: configuration)
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Failed to sync expense to Vercel:", error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            if let responseString = String(data: data, encoding: .utf8) {
                print("Sync Server Response:", responseString)
            }
        }.resume()
    }
}
