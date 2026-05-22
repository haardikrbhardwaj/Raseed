//
//  AddExpenseView.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {

    @Environment(\.modelContext)
    private var context

    @Environment(\.dismiss)
    private var dismiss

    @StateObject
    private var vm = AddExpenseViewModel()

    @State
    private var showSuccess = false

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black
                    .ignoresSafeArea()

                VStack(spacing: 24) {

                    Text("Add Expense")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)

                    TextField("Amount", text: $vm.amount)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(AppColors.card)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        .foregroundColor(.white)

                    TextField("Merchant", text: $vm.merchant)
                        .padding()
                        .background(AppColors.card)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        .foregroundColor(.white)

                    ScrollView(
                        .horizontal,
                        showsIndicators: false
                    ) {

                        HStack(spacing: 16) {

                            ForEach(Category.mock) { category in

                                Button {

                                    vm.selectedCategory = category

                                } label: {

                                    VStack(spacing: 10) {

                                        Text(category.icon)
                                            .font(.title)

                                        Text(category.name)
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .background(
                                        vm.selectedCategory.name == category.name
                                        ? Color.yellow.opacity(0.3)
                                        : AppColors.card
                                    )
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 20)
                                    )
                                }
                            }
                        }
                    }

                    Spacer()

                    Button {

                        hideKeyboard()

                        guard !vm.amount.isEmpty,
                              !vm.merchant.isEmpty else {
                            return
                        }

                        Task {

                            await vm.saveExpense(
                                context: context
                            )

                            UIImpactFeedbackGenerator(
                                style: .rigid
                            ).impactOccurred()

                            withAnimation(
                                .spring(
                                    response: 0.45,
                                    dampingFraction: 0.8
                                )
                            ) {

                                showSuccess = true
                            }

                            try? await Task.sleep(
                                for: .seconds(0.9)
                            )

                            withAnimation(
                                .easeInOut(duration: 0.25)
                            ) {

                                showSuccess = false
                            }

                            try? await Task.sleep(
                                for: .milliseconds(250)
                            )

                            dismiss()
                        }

                    } label: {

                        ZStack {

                            RoundedRectangle(
                                cornerRadius: 22
                            )
                            .fill(Color.yellow)

                            Text("Save Expense")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                        .frame(height: 58)
                    }
                }
                .padding()

                if showSuccess {

                    VStack(spacing: 16) {

                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.green)

                        Text("Expense Saved")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .padding(30)
                    .background(.ultraThinMaterial)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 30)
                    )
                    .transition(
                        .scale.combined(with: .opacity)
                    )
                }
            }
            .navigationBarHidden(true)
        }
    }
}

extension View {

    func hideKeyboard() {

        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
