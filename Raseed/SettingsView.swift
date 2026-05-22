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

                        Text("Settings")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)

                        VStack(spacing: 16) {

                            NavigationLink {

                                BudgetSettingsView()

                            } label: {

                                settingsRow(
                                    title: "Monthly Budget",
                                    icon: "target"
                                )
                            }

                            NavigationLink {

                                Text("Coming Soon")
                                    .foregroundColor(.white)
                                    .background(Color.black)

                            } label: {

                                settingsRow(
                                    title: "Notion Sync",
                                    icon: "link"
                                )
                            }

                            NavigationLink {

                                Text("Coming Soon")
                                    .foregroundColor(.white)
                                    .background(Color.black)

                            } label: {

                                settingsRow(
                                    title: "AI Insights",
                                    icon: "sparkles"
                                )
                            }

                            NavigationLink {

                                Text("Coming Soon")
                                    .foregroundColor(.white)
                                    .background(Color.black)

                            } label: {

                                settingsRow(
                                    title: "Notifications",
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
                .foregroundColor(.yellow)

            Text(title)
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

