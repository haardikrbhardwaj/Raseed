////
////  AddExpenseView.swift
////  Raseed
////
////  Created by Hardik Bhardwaj on 22/05/26.
////
//
//import SwiftUI
//import SwiftData
//
//struct AddExpenseView: View {
//
//    @Environment(\.modelContext)
//    private var context
//
//    @Environment(\.dismiss)
//    private var dismiss
//
//    @StateObject
//    private var vm = AddExpenseViewModel()
//
//    @State
//    private var showSuccess = false
//
//    var body: some View {
//
//        NavigationStack {
//
//            ZStack {
//
//                Color.black
//                    .ignoresSafeArea()
//
//                VStack(alignment: .leading, spacing: 24) {
//
//                    Text("add_expense")
//                        .font(.largeTitle.bold())
//                        .foregroundColor(.white)
//                        .frame(
//                            maxWidth: .infinity,
//                            alignment: .leading
//                        )
//
//                    TextField(
//                        "amount",
//                        text: $vm.amount
//                    )
//                    .keyboardType(.decimalPad)
//                    .padding()
//                    .background(AppColors.card)
//                    .clipShape(
//                        RoundedRectangle(cornerRadius: 20)
//                    )
//                    .foregroundColor(.white)
//
//                    TextField(
//                        "merchant",
//                        text: $vm.merchant
//                    )
//                    .padding()
//                    .background(AppColors.card)
//                    .clipShape(
//                        RoundedRectangle(cornerRadius: 20)
//                    )
//                    .foregroundColor(.white)
//
//                    Text("category")
//                        .foregroundColor(.gray)
//                        .font(.headline)
//
//                    ScrollView(
//                        .horizontal,
//                        showsIndicators: false
//                    ) {
//
//                        HStack(spacing: 14) {
//
//                            ForEach(Category.mock) { category in
//
//                                Button {
//
//                                    withAnimation(.spring) {
//
//                                        vm.selectedCategory = category
//                                    }
//
//                                } label: {
//
//                                    VStack(spacing: 13) {
//
//                                        Text(category.icon)
//                                            .font(.system(size: 28))
//
//                                        Text(
//                                            NSLocalizedString(
//                                                category.name,
//                                                comment: ""
//                                            )
//                                        )
//                                            .foregroundColor(.white)
//                                            .font(.subheadline)
//                                            .fontWeight(.medium)
//                                    }
//                                    .frame(
//                                        width: 95,
//                                        height: 110
//                                    )
//                                    .background(
//                                        vm.selectedCategory.name == category.name
//                                        ? Color.gray.opacity(0.25)
//                                        : AppColors.card
//                                    )
//                                    .overlay {
//
//                                        RoundedRectangle(
//                                            cornerRadius: 24
//                                        )
//                                        .stroke(
//                                            vm.selectedCategory.name == category.name
//                                            ? Color.yellow
//                                            : Color.clear,
//                                            lineWidth: 1.5
//                                        )
//                                    }
//                                    .clipShape(
//                                        RoundedRectangle(
//                                            cornerRadius: 24
//                                        )
//                                    )
//                                    .scaleEffect(
//                                        vm.selectedCategory.name == category.name
//                                        ? 1.03
//                                        : 1
//                                    )
//                                    .animation(
//                                        .spring(
//                                            response: 0.3,
//                                            dampingFraction: 0.7
//                                        ),
//                                        value: vm.selectedCategory.name
//                                    )
//                                }
//                            }
//                        }
//                        .padding(.horizontal, 2)
//                    }
//
//                    if vm.selectedCategory.name == "Other" {
//
//                        VStack(
//                            alignment: .leading,
//                            spacing: 10
//                        ) {
//
//                            Text("custom_category")
//                                .foregroundColor(.gray)
//                                .font(.subheadline)
//
//                            TextField(
//                                "enter_category_name",
//                                text: $vm.customCategory
//                            )
//                            .padding()
//                            .background(AppColors.card)
//                            .clipShape(
//                                RoundedRectangle(
//                                    cornerRadius: 20
//                                )
//                            )
//                            .foregroundColor(.white)
//                        }
//                        .transition(
//                            .move(edge: .top)
//                            .combined(with: .opacity)
//                        )
//                    }
//
//                    Spacer()
//
//                    Button {
//
//                        hideKeyboard()
//
//                        guard !vm.amount.isEmpty,
//                              !vm.merchant.isEmpty else {
//                            return
//                        }
//
//                        Task {
//
//                            await vm.saveExpense(
//                                context: context
//                            )
//
//                            UIImpactFeedbackGenerator(
//                                style: .rigid
//                            ).impactOccurred()
//
//                            withAnimation(
//                                .spring(
//                                    response: 0.45,
//                                    dampingFraction: 0.8
//                                )
//                            ) {
//
//                                showSuccess = true
//                            }
//
//                            try? await Task.sleep(
//                                for: .seconds(0.9)
//                            )
//
//                            withAnimation(
//                                .easeInOut(duration: 0.25)
//                            ) {
//
//                                showSuccess = false
//                            }
//
//                            try? await Task.sleep(
//                                for: .milliseconds(250)
//                            )
//
//                            dismiss()
//                        }
//
//                    } label: {
//
//                        ZStack {
//
//                            RoundedRectangle(
//                                cornerRadius: 22
//                            )
//                            .fill(Color.white)
//
//                            Text("save_expense")
//                                .foregroundColor(.black)
//                                .fontWeight(.bold)
//                        }
//                        .frame(height: 58)
//                    }
//                }
//                .padding()
//
//                if showSuccess {
//
//                    VStack(spacing: 16) {
//
//                        Image(
//                            systemName: "checkmark.circle.fill"
//                        )
//                        .font(.system(size: 60))
//                        .foregroundColor(.gray)
//
//                        Text("expense_saved")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                    }
//                    .padding(30)
//                    .background(.ultraThinMaterial)
//                    .clipShape(
//                        RoundedRectangle(cornerRadius: 30)
//                    )
//                    .transition(
//                        .scale.combined(with: .opacity)
//                    )
//                }
//            }
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//extension View {
//
//    func hideKeyboard() {
//
//        UIApplication.shared.sendAction(
//            #selector(UIResponder.resignFirstResponder),
//            to: nil,
//            from: nil,
//            for: nil
//        )
//    }
//}


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

                VStack(alignment: .leading, spacing: 24) {

                    Text("add_expense")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )

                    TextField(
                        "amount",
                        text: $vm.amount
                    )
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(AppColors.card)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    .foregroundColor(.white)

                    TextField(
                        "merchant",
                        text: $vm.merchant
                    )
                    .padding()
                    .background(AppColors.card)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    .foregroundColor(.white)

                    Text("category")
                        .foregroundColor(.gray)
                        .font(.headline)

                    ScrollView(
                        .horizontal,
                        showsIndicators: false
                    ) {

                        HStack(spacing: 14) {

                            ForEach(Category.mock) { category in

                                Button {

                                    withAnimation(.spring) {
                                        vm.selectedCategory = category
                                    }

                                } label: {

                                    VStack(spacing: 13) {

                                        Text(category.icon)
                                            .font(.system(size: 28))

                                        // 🛠️ FIXED: Forces SwiftUI lookup via localized keys matching your strings catalog
                                        Text(LocalizedStringKey(category.name.lowercased()))
                                            .foregroundColor(.white)
                                            .font(.subheadline)
                                            .fontWeight(.medium)
                                    }
                                    .frame(
                                        width: 95,
                                        height: 110
                                    )
                                    .background(
                                        vm.selectedCategory.name == category.name
                                        ? Color.gray.opacity(0.25)
                                        : AppColors.card
                                    )
                                    .overlay {

                                        RoundedRectangle(
                                            cornerRadius: 24
                                        )
                                        .stroke(
                                            vm.selectedCategory.name == category.name
                                            ? Color.yellow
                                            : Color.clear,
                                            lineWidth: 1.5
                                        )
                                    }
                                    .clipShape(
                                        RoundedRectangle(
                                            cornerRadius: 24
                                        )
                                    )
                                    .scaleEffect(
                                        vm.selectedCategory.name == category.name
                                        ? 1.03
                                        : 1
                                    )
                                    .animation(
                                        .spring(
                                            response: 0.3,
                                            dampingFraction: 0.7
                                        ),
                                        value: vm.selectedCategory.name
                                    )
                                }
                            }
                        }
                        .padding(.horizontal, 2)
                    }

                    // FIXED: Case-matched check for "other" instead of "Other"
                    if vm.selectedCategory.name.lowercased() == "other" {

                        VStack(
                            alignment: .leading,
                            spacing: 10
                        ) {

                            Text("custom_category")
                                .foregroundColor(.gray)
                                .font(.subheadline)

                            TextField(
                                "enter_category_name",
                                text: $vm.customCategory
                            )
                            .padding()
                            .background(AppColors.card)
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 20
                                )
                            )
                            .foregroundColor(.white)
                        }
                        .transition(
                            .move(edge: .top)
                            .combined(with: .opacity)
                        )
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
                            .fill(Color.white)

                            Text("save_expense")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                        .frame(height: 58)
                    }
                }
                .padding()

                if showSuccess {

                    VStack(spacing: 16) {

                        Image(
                            systemName: "checkmark.circle.fill"
                        )
                        .font(.system(size: 60))
                        .foregroundColor(.gray)

                        Text("expense_saved")
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
