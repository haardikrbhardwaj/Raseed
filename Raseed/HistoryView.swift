import SwiftUI
import SwiftData

struct HistoryView: View {

    @Environment(\.modelContext)
    private var context

    @StateObject
    private var languageManager = LanguageManager.shared

    @Query(
        sort: \Expense.createdAt,
        order: .reverse
    )
    private var expenses: [Expense]

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black
                    .ignoresSafeArea()

                if expenses.isEmpty {

                    VStack(spacing: 20) {

                        Image(systemName: "tray.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)

                        Text("no_expenses_yet")
                            .font(.title2.bold())
                            .foregroundColor(.white)

                        Text("expenses_appear_here")
                            .foregroundColor(.gray)
                    }

                } else {

                    List {

                        ForEach(expenses) { expense in

                            ExpenseCard(
                                expense: expense
                            )
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .listRowInsets(
                                EdgeInsets(
                                    top: 8,
                                    leading: 16,
                                    bottom: 8,
                                    trailing: 16
                                )
                            )
                            .swipeActions(edge: .trailing) {

                                Button(role: .destructive) {

                                    deleteExpense(expense)

                                } label: {

                                    Label(
                                        NSLocalizedString("delete", comment: ""),
                                        systemImage: "trash.fill"
                                    )
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .background(Color.black)
                }
            }
            .navigationTitle(
                NSLocalizedString("history", comment: "")
            )
            .navigationBarTitleDisplayMode(.large)
            .id(languageManager.selectedLanguage)
        }
    }

    private func deleteExpense(_ expense: Expense) {

        withAnimation(.smooth) {

            context.delete(expense)

            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}
