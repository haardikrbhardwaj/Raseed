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
                    Label("Home", systemImage: "house.fill")
                }

            AnalyticsView()
                .tabItem {
                    Label("Analytics", systemImage: "chart.pie.fill")
                }

            AddExpenseView()
                .tabItem {
                    Label("Add", systemImage: "plus.circle.fill")
                }

            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .preferredColorScheme(.dark)
    }
}
