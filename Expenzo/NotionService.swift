////
////  NotionService.swift
////  Raseed
////
////  Created by Hardik Bhardwaj on 22/05/26.
////
//
//
//import Foundation
//
//final class NotionService {
//
//    static let shared = NotionService()
//
//    func createExpense(
//        token: String,
//        databaseID: String,
//        expense: Expense
//    ) async throws {
//
//        let url = URL(
//            string: "https://api.notion.com/v1/pages"
//        )!
//
//        var request = URLRequest(url: url)
//
//        request.httpMethod = "POST"
//
//        request.setValue(
//            "Bearer \(token)",
//            forHTTPHeaderField: "Authorization"
//        )
//
//        request.setValue(
//            "application/json",
//            forHTTPHeaderField: "Content-Type"
//        )
//
//        request.setValue(
//            "2022-06-28",
//            forHTTPHeaderField: "Notion-Version"
//        )
//
//        let body: [String: Any] = [
//            "parent": [
//                "database_id": databaseID
//            ],
//            "properties": [
//                "Expense": [
//                    "title": [[
//                        "text": [
//                            "content": expense.merchant
//                        ]
//                    ]]
//                ],
//                "Amount": [
//                    "number": expense.amount
//                ],
//                "Category": [
//                    "select": [
//                        "name": expense.category
//                    ]
//                ],
//                "Date": [
//                    "date": [
//                        "start": ISO8601DateFormatter()
//                            .string(from: expense.createdAt)
//                    ]
//                ]
//            ]
//        ]
//
//        request.httpBody = try JSONSerialization.data(
//            withJSONObject: body
//        )
//
//        _ = try await URLSession.shared.data(for: request)
//    }
//}
