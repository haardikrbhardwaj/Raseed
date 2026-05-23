//
//  RaseedApp.swift
//  Raseed
//

import SwiftUI
import SwiftData

@main
struct RaseedApp: App {

    @StateObject
    private var languageManager =
    LanguageManager.shared

    @AppStorage("hasCompletedOnboarding")
    private var hasCompletedOnboarding = false

    var sharedModelContainer: ModelContainer = {

        let schema = Schema([
            Expense.self
        ])

        let modelConfiguration =
        ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )

        do {

            return try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )

        } catch {

            fatalError(
                "Could not create ModelContainer: \(error)"
            )
        }
    }()

    var body: some Scene {

        WindowGroup {

            Group {

                if hasCompletedOnboarding {

                    RootView()

                } else {

                    OnboardingCoordinatorView()
                }
            }
            .environment(
                \.locale,
                 Locale(
                    identifier:
                    languageManager.selectedLanguage
                 )
            )
        }
        .modelContainer(sharedModelContainer)
    }
}
