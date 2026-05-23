import SwiftUI
import SwiftData

struct HomeView: View {

    @Environment(\.modelContext)
    private var context

    @StateObject
    private var vm = HomeViewModel()
    
    @AppStorage("monthlyBudget")
    private var monthlyBudget: Double = 50000
    

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black
                    .ignoresSafeArea()

                ScrollView {

                    VStack(spacing: 24) {

                        HeaderView()

                        BalanceCard(
                            totalSpent: vm.totalSpent,
                            monthlyBudget: monthlyBudget
                        )

//                        InsightCard(
//                            insight: vm.aiInsight
//                        )

                        VStack(spacing: 16) {

                            ForEach(vm.expenses, id: \.id) { expense in

                                ExpenseCard(
                                    expense: expense
                                )
                            }
                        }
                    }
                    .padding()
                }
            }
            .onAppear {

                vm.loadExpenses(context: context)
            }
        }
    }
}
