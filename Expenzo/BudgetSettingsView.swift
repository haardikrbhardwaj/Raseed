//
//  BudgetSettingsView.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 23/05/26.
//

import SwiftUI

struct BudgetSettingsView: View {

    @AppStorage("monthlyBudget")
    private var monthlyBudget: Double = 0

    @AppStorage("selectedCurrency")
    private var selectedCurrency = "INR"

    @State
    private var budgetInput = ""

    @State
    private var showSaved = false

    private var currencies: [String] {

        Locale.commonISOCurrencyCodes.sorted()
    }

    var body: some View {

        ZStack {

            Color.black
                .ignoresSafeArea()

            VStack(
                alignment: .leading,
                spacing: 24
            ) {

                Text("monthly_budget")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                VStack(
                    alignment: .leading,
                    spacing: 22
                ) {

                    // MARK: CURRENT BUDGET

                    VStack(
                        alignment: .leading,
                        spacing: 8
                    ) {

                        Text("update_budget")
                            .foregroundColor(.gray)

                        Text(
                            monthlyBudget,
                            format: .currency(
                                code: selectedCurrency
                            )
                        )
                        .font(
                            .system(
                                size: 42,
                                weight: .bold
                            )
                        )
                        .foregroundColor(.white)
                    }

                    // MARK: CURRENCY PICKER

                    VStack(
                        alignment: .leading,
                        spacing: 12
                    ) {

                        Text("currency")
                            .foregroundColor(.gray)

                        Menu {

                            ForEach(
                                currencies,
                                id: \.self
                            ) { currencyCode in

                                Button {

                                    selectedCurrency =
                                    currencyCode

                                } label: {

                                    HStack {

                                        Text(
                                            currencySymbol(
                                                for: currencyCode
                                            )
                                        )

                                        Text(currencyCode)
                                    }
                                }
                            }

                        } label: {

                            HStack {

                                VStack(
                                    alignment: .leading,
                                    spacing: 4
                                ) {

                                    Text(
                                        currencySymbol(
                                            for: selectedCurrency
                                        )
                                    )
                                    .foregroundColor(.white)
                                    .font(.headline)

                                    Text(selectedCurrency)
                                        .foregroundColor(.gray)
                                        .font(.caption)
                                }

                                Spacer()

                                Image(
                                    systemName: "chevron.down"
                                )
                                .foregroundColor(.gray)
                            }
                            .padding()
                            .background(AppColors.card)
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 20
                                )
                            )
                        }
                    }

                    // MARK: BUDGET INPUT

                    VStack(
                        alignment: .leading,
                        spacing: 12
                    ) {

                        Text("update_budget")
                            .foregroundColor(.gray)

                        TextField(
                            "update_budget_placeholder",
                            text: $budgetInput
                        )
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(AppColors.card)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 20
                            )
                        )
                        .foregroundColor(.white)
                    }

                    // MARK: SAVE BUTTON

                    Button {

                        hideKeyboard()

                        guard let value =
                        Double(budgetInput) else {
                            return
                        }

                        monthlyBudget = value

                        withAnimation(.spring) {

                            showSaved = true
                        }

                        UIImpactFeedbackGenerator(
                            style: .medium
                        ).impactOccurred()

                        DispatchQueue.main.asyncAfter(
                            deadline: .now() + 1.2
                        ) {

                            withAnimation {

                                showSaved = false
                            }
                        }

                        budgetInput = ""

                    } label: {

                        ZStack {

                            RoundedRectangle(
                                cornerRadius: 20
                            )
                            .fill(Color.white)

                            Text("save_settings")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                        .frame(height: 56)
                    }
                }
                .padding()
                .background(AppColors.card)
                .clipShape(
                    RoundedRectangle(cornerRadius: 30)
                )

                Spacer()
            }
            .padding()

            // MARK: SUCCESS POPUP

            if showSaved {

                VStack(spacing: 14) {

                    Image(
                        systemName: "checkmark.circle.fill"
                    )
                    .font(.system(size: 55))
                    .foregroundColor(.gray)

                    Text("settings_updated")
                        .foregroundColor(.white)
                        .font(.headline)
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
    }

    // MARK: CURRENCY SYMBOL

    private func currencySymbol(
        for code: String
    ) -> String {

        Locale.current.localizedString(
            forCurrencyCode: code
        ) ?? code
    }
}
