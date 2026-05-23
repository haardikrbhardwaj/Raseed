//
//
//import SwiftUI
//
//struct RootView: View {
//    // Reads local storage using the exact key monitored by RaseedApp
//    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = true
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
//            // Pass down the closure to update the local onboarding state on logout
//            SettingsView {
//                withAnimation(.easeInOut(duration: 0.35)) {
//                    hasCompletedOnboarding = false
//                }
//            }
//            .tabItem {
//                Label("settings", systemImage: "gearshape.fill")
//            }
//        }
//        .preferredColorScheme(.dark)
//    }
//}
import SwiftUI

struct RootView: View {

    @AppStorage("hasCompletedOnboarding")
    private var hasCompletedOnboarding = true

    init() {

        let accentColor = UIColor(
            red: 0.85,
            green: 0.85,
            blue: 0.87,
            alpha: 1
        )

        let appearance = UITabBarAppearance()

        appearance.configureWithOpaqueBackground()

        appearance.backgroundColor = .black

        // Selected
        appearance.stackedLayoutAppearance.selected.iconColor =
        accentColor

        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: accentColor
        ]

        // Unselected
        appearance.stackedLayoutAppearance.normal.iconColor =
        UIColor.darkGray

        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.darkGray
        ]

        UITabBar.appearance().standardAppearance =
        appearance

        UITabBar.appearance().scrollEdgeAppearance =
        appearance
    }

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
