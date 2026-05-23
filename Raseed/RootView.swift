////
////  RootView 2.swift
////  Raseed
////
////  Created by Hardik Bhardwaj on 22/05/26.
////
//
//import SwiftUI
//
//struct RootView: View {
//
//    var body: some View {
//
//        TabView {
//
//            HomeView()
//                .tabItem {
//                    Label("home", systemImage: "house.fill")
//                }
//
//            AnalyticsView()
//                .tabItem {
//                    Label("analytics", systemImage: "chart.pie.fill")
//                }
//
//            AddExpenseView()
//                .tabItem {
//                    Label("add", systemImage: "plus.circle.fill")
//                }
//
//            HistoryView()
//                .tabItem {
//                    Label("history", systemImage: "clock.fill")
//                }
//
//            SettingsView(onLogout: () -> OnboardingCoordinatorView)
//                .tabItem {
//                    Label("settings", systemImage: "gearshape.fill")
//                }
//        }
//        .preferredColorScheme(.dark)
//    }
//}
//
//  RootView.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//

import SwiftUI

struct RootView: View {
    // Reads local storage using the exact key monitored by RaseedApp
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = true

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

            // Pass down the closure to update the local onboarding state on logout
            SettingsView {
                withAnimation(.easeInOut(duration: 0.35)) {
                    hasCompletedOnboarding = false
                }
            }
            .tabItem {
                Label("settings", systemImage: "gearshape.fill")
            }
        }
        .preferredColorScheme(.dark)
    }
}
