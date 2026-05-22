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

            VStack(spacing: 24) {

                Text("Settings")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                settingsRow(
                    title: "Notion Sync",
                    icon: "link"
                )

                settingsRow(
                    title: "AI Insights",
                    icon: "sparkles"
                )

                settingsRow(
                    title: "Notifications",
                    icon: "bell"
                )

                Spacer()
            }
            .padding()
            .background(AppColors.background)
        }
    }

    func settingsRow(title: String, icon: String) -> some View {

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
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}