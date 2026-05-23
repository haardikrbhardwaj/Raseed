//
//  RootView 2.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//

import SwiftUI

struct RootView: View {

    var body: some View {

        TabView {

            HomeView()
                .tabItem {
                    Label("home", systemImage: "house.fill")
                }

            AnalyticsView()
                .tabItem {
                    Label("analytics", systemImage: "chart.pie.fill")
                }

            AddExpenseView()
                .tabItem {
                    Label("add", systemImage: "plus.circle.fill")
                }

            HistoryView()
                .tabItem {
                    Label("history", systemImage: "clock.fill")
                }

            SettingsView()
                .tabItem {
                    Label("settings", systemImage: "gearshape.fill")
                }
        }
        .preferredColorScheme(.dark)
    }
}
