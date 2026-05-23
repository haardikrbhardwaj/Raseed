//
//  SettingsView.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//

import SwiftUI

struct SettingsView: View {

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black
                    .ignoresSafeArea()

                ScrollView {

                    VStack(
                        alignment: .leading,
                        spacing: 24
                    ) {

                        // MARK: HEADER

                        Text("settings")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)

                        VStack(spacing: 16) {

                            NavigationLink {

                                BudgetSettingsView()

                            } label: {

                                settingsRow(
                                    title: "monthly_budget",
                                    icon: "target"
                                )
                            }
                            NavigationLink {

                                LanguageSettingsView()

                            } label: {

                                settingsRow(
                                    title: "language",
                                    icon: "globe"
                                )
                            }

                            NavigationLink {

                                Text("coming_soon")
                                    .foregroundColor(.white)
                                    .background(Color.black)

                            } label: {

                                settingsRow(
                                    title: "notion_sync",
                                    icon: "link"
                                )
                            }

                            NavigationLink {

                                Text("coming_soon")
                                    .foregroundColor(.white)
                                    .background(Color.black)

                            } label: {

                                settingsRow(
                                    title: "ai_insights",
                                    icon: "sparkles"
                                )
                            }

                            NavigationLink {

                                Text("coming_soon")
                                    .foregroundColor(.white)
                                    .background(Color.black)

                            } label: {

                                settingsRow(
                                    title: "notifications",
                                    icon: "bell"
                                )
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }

    // MARK: SETTINGS ROW
    func settingsRow(
        title: String,
        icon: String
    ) -> some View {

        HStack {

            Image(systemName: icon)
                .foregroundColor(.white)

            Text(
                LocalizedStringKey(title)
            )
            .foregroundColor(.white)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(AppColors.card)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    }
}

// MARK: - BUDGET SETTINGS VIEW

